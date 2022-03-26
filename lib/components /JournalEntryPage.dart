import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:intl/intl.dart';
import 'package:mindseries/models/journal_entry.dart';
import 'package:uuid/uuid.dart';

class JournalEntryPage extends StatefulWidget {
  final bool today;
  const JournalEntryPage({Key? key, this.today = false}) : super(key: key);

  @override
  _JournalEntryPageState createState() => _JournalEntryPageState();
}

class _JournalEntryPageState extends State<JournalEntryPage> {
  JournalEntry entry = JournalEntry(
      id: Uuid().v1(),
      timestamp: DateTime.now().millisecondsSinceEpoch,
      grateful: ["", "", ""],
      affirmation: ["", "", ""]);
  @override
  Widget build(BuildContext context) {
    return widget.today ? buildCurrentPage2() : buildPage();
  }

  Widget buildCurrentPage2() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 100,top: 15),
        child: Column(
          children: [
            Center(
              child: Text(DateFormat.yMd().format(DateTime.now())),
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
                .map((e) => Container(
                    margin: const EdgeInsets.all(5),
                    child: TextField(
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
                    )))
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
            ...((entry.grateful ?? [])
                .map((e) => Container(
                    height: 30,
                    margin: const EdgeInsets.all(5),
                    child: TextField(
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
                    )))
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
          ],
        ),
      ),
    );
  }

  Widget buildCurrentPage() {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.translate(
            //adds transformation to widget relative to device
            offset: Offset(0, -50), //x and y fields moves text
            child: Container(
                child:
                    //aligns mindseries text to the centre
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                  Icon(
                    FontAwesome5.circle_notch,
                    color: Colors.white,
                  ),
                  Text("Mind Series",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'PoiretOne',
                      )),
                ])),
          ),

          //journal title
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                FontAwesome5.book,
                color: Colors.white,
              ),
              Text(
                'Journal',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  fontFamily: 'Cabin',
                ),
              )
            ],
          )),

          SizedBox(
            height: 50,
          ),

          //date
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text(
              //   'Username',
              //   style: TextStyle(
              //     fontWeight: FontWeight.w600,
              //     color: Colors.white,
              //     fontSize: 18,
              //     fontFamily: 'Cabin'
              //   ),),
              Text(
                'date',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: Colors.white,
                ),
              )
            ],
          )),

          SizedBox(
            height: 30,
          ),

          //name 3 things - gratitude
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

          //gratitude textbox 1
          Container(
              height: 30,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'type text...',
                    fillColor: Colors.white,
                    filled: true,
                    //font style cabin
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              )),

          SizedBox(
            height: 10,
          ),

          //gratitude textbox 2
          Container(
              height: 30,
              child: TextField(
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                    //  hintText: 'type text...',
                    fillColor: Colors.white,
                    filled: true,
                    //font style cabin
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              )),

          SizedBox(
            height: 10,
          ),

          //gratitude textbox 3
          Container(
              height: 30,
              child: TextField(
                decoration: InputDecoration(
                    // hintText: 'type text...',
                    fillColor: Colors.white,
                    filled: true,
                    //font style cabin
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              )),

          SizedBox(
            height: 15,
          ),

          //name 3 things - affirmations
          Container(
            height: 20,
            // color: Colors.white,
            child: Row(
              children: [
                Text(
                  'Write down 3 affirmations',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),

          SizedBox(
            height: 15,
          ),

          //affirmations textbox
          Container(
              height: 30,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'type text...',
                    fillColor: Colors.white,
                    filled: true,
                    //font style cabin
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              )),

          SizedBox(
            height: 10,
          ),

          //affirmations textbox
          Container(
              height: 30,
              child: TextField(
                decoration: InputDecoration(
                    // hintText: 'type text...',
                    fillColor: Colors.white,
                    filled: true,
                    //font style cabin
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              )),

          SizedBox(
            height: 10,
          ),

          //affirmations textbox
          Container(
              height: 30,
              child: TextField(
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                    // hintText: 'type text...',
                    fillColor: Colors.white,
                    filled: true,
                    //font style cabin
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              )),

          SizedBox(
            height: 40,
          ),

          //textbox
          Container(
              height: 100,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'whats on your mind ...',
                    fillColor: Colors.white,
                    filled: true,
                    //font style cabin
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              )),
        ],
      ),
    );
  }

  buildPage() {
    return Container();
  }
}
