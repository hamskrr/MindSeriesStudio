import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:intl/intl.dart';
import 'package:mindseries/misc/MSColors.dart';
import 'package:mindseries/models/journal_entry.dart';
import 'package:mindseries/providers/database_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../providers/profileProvider.dart';

class JournalEntryPage extends StatefulWidget {
  final bool today;
  final JournalEntry? entry;
  const JournalEntryPage({Key? key, this.today = false, this.entry}) : super(key: key);

  @override
  _JournalEntryPageState createState() => _JournalEntryPageState();
}

class _JournalEntryPageState extends State<JournalEntryPage> {

  bool editMode = true;
  bool saving = false;
  late JournalEntry entry;
  @override
  void initState() {
    // TODO: implement initState
    editMode = widget.today;
    if(widget.entry == null){
      entry = JournalEntry(id: "", timestamp: DateTime.now().millisecondsSinceEpoch,grateful: ["","",""],affirmation: ["","",""]);
    }else{
      entry = widget.entry!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.today ? editMode ? buildCurrentPageEdit() :  buildCurrentPage2() : buildCurrentPage2();
  }

  Widget buildCurrentPageEdit() {
    int greatefullCount = 0;
    int affirmationCount = 0;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 100,top: 15),
        child: Column(
          children: [
            Center(
              child: Text("${DateFormat.yMd().format(DateTime.fromMillisecondsSinceEpoch(entry.timestamp.toInt()))} | ${DateFormat.j().format(DateTime.fromMillisecondsSinceEpoch(entry.timestamp.toInt()))}"),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    'Name 3 things you are grateful for',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ...((entry.grateful ?? [])
                .map((e) {
              greatefullCount++;
                  return Container(
                    margin: const EdgeInsets.all(5),
                    child: TextField(
                      onChanged: (v){
                        entry.grateful![greatefullCount] = v;
                      },
                      style: TextStyle(color: Colors.black,fontSize: 14),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                          hintStyle: TextStyle(color: Colors.black45),
                          hintText: 'type text...',
                          isDense: true,
                          fillColor: Colors.white,
                          filled: true,
                          //font style cabin
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ));})
                .toList()),
            SizedBox(
              height: 25,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                'Write down 3 affirmations',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ...((entry.affirmation ?? [])
                .map((e) {
              affirmationCount++;
                  return Container(
                    height: 30,
                    margin: const EdgeInsets.all(5),
                    child: TextField(
                      onChanged: (v){
                        entry.grateful![greatefullCount] = v;
                      },
                      style: TextStyle(color: Colors.black,fontSize: 14),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                          hintStyle: TextStyle(color: Colors.black45),
                          hintText: 'type text...',
                          fillColor: Colors.white,
                          filled: true,
                          isDense: true,
                          //font style cabin
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ));})
                .toList()),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                width: 60,
                height: 8,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white60),
              ),
            ),
            SizedBox(
              height: 40,
            ),

            //affirmations textbox
            Container(
                child: TextField(
                  textAlign: TextAlign.left,
                  onChanged: (v){
                    entry.title = v;
                  },
                  style: TextStyle(color: Colors.black,fontSize: 14),
                  decoration: InputDecoration(
                      hintText: 'type text...',
                      contentPadding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                      isDense: true,
                      hintStyle: TextStyle(color: Colors.black45),
                      fillColor: Colors.white,
                      filled: true,
                      //font style cabin
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),

            SizedBox(
              height: 20,
            ),

            //textbox
            Container(
                child: TextField(
                  onChanged: (v){
                    entry.notes = v;
                  },
                  style: TextStyle(color: Colors.black),
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: 'whats on your mind ...',
                      contentPadding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                      isDense: true,
                      fillColor: Colors.white,
                      filled: true,
                      //font style cabin
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),
SizedBox(height: 30,),
           saving ? Container(
             child: CircularProgressIndicator(),
           ):
            ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(MSColors.buttonColor),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)))
                ),
                icon:Icon(Icons.save),
                onPressed: saveEntry, label:Text("Save"))
          ],
        ),
      ),
    );
  }

  Widget buildCurrentPage2() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 100,top: 15),
        child: Column(
          children: [
            Center(
              child: Text("${DateFormat.yMd().format(DateTime.fromMillisecondsSinceEpoch(entry.timestamp.toInt()))} | ${DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(entry.timestamp.toInt()))}"),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    "Things I'm Grateful for",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            (entry.grateful ?? []).where((element) => element.isNotEmpty).isEmpty ? Row(
              children: [
                Text("N/A",textAlign: TextAlign.left,),
              ],
            ):Container(),
            ...((entry.grateful ?? []).where((element) => element.isNotEmpty)
                .map((e) => Container(
                margin: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Text("0"),
                    SizedBox(width: 10,),
                    Text("$e")
                  ],
                )))
                .toList()),
            SizedBox(
              height: 25,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    'My Affirmations',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            (entry.affirmation ?? []).where((element) => element.isNotEmpty).isEmpty ? Row(
              children: [
                Text("N/A",textAlign: TextAlign.left,),
              ],
            ):Container(),
            ...((entry.affirmation ?? []).where((element) => element.isNotEmpty)
                .map((e) => Container(
                margin: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Text("0"),
                    SizedBox(width: 10,),
                    Text("$e")
                  ],
                )))
                .toList()),
            SizedBox(
              height: 40,
            ),

            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Text(entry.title??"Sample Title",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Text(entry.notes??"",
                    textAlign: TextAlign.left,
                    maxLines: null,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),),
                ),
              ],
            ),
            //textbox

            SizedBox(height: 30,),
            widget.today || !editMode ? Container(
            ):
            ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(MSColors.buttonColor),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)))
                ),
                icon:Icon(Icons.save),
                onPressed: saveEntry, label:Text("Save"))

          ],
        ),
      ),
    );
  }

  buildPage() {
    return Container();
  }

  void saveEntry() async{
    // add
    final today = DateTime.now();
    final todayStart = DateTime(today.year,today.month,today.day);
    entry.id = "${todayStart.millisecondsSinceEpoch}_${Uuid().v1()}";
    setState(() {
      saving = true;
    });
    await DBProvider.of(context)?.db?.addJournalEntry(uid: Provider.of<ProfileProvider>(context,listen:false).currentProfile?.uid??"", entry: entry);
    setState(() {
      saving = false;
      editMode = false;
    });
  }
}
