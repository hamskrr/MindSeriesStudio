import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:mindseries/components%20/JournalCalendar.dart';
import 'package:mindseries/pages/splash_screen.dart';
import 'package:mindseries/providers/database_provider.dart';
import 'package:mindseries/providers/profileProvider.dart';
import 'package:provider/provider.dart';

import '../../components /JournalEntryPage.dart';
import '../../components /appBar.dart';
import '../../models/journal_entry.dart';

class JournalPage extends StatefulWidget {
  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  bool calView = false;
  PageController controller = PageController(initialPage: 0 );
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<JournalEntry>>(
      stream: DBProvider.of(context)?.db?.retrieveJournal(uid: Provider.of<ProfileProvider>(context, listen: false).currentProfile?.uid??"--"),
      builder: (context, snapshot) {
        switch(snapshot.connectionState){

          case ConnectionState.waiting:
           return SplashScreen();

          default: return buildPages(entries:snapshot.data??[]);
        }
      }
    );
  }

  buildPages({List<JournalEntry> entries = const[]}) {
    controller = PageController(initialPage: entries.length);
    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 34, 56, 1),
      extendBodyBehindAppBar: true,

      appBar: MSAppBar.getAppBar(
          backgroundColor:Colors.transparent,
          actions: [
            IconButton(onPressed: (){
              setState(() {
                calView=!calView;
              });
            }, icon: Icon(calView ? Icons.view_carousel : Icons.calendar_today_rounded)),
            IconButton(onPressed: (){
             controller.animateToPage(entries.length, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
            }, icon: const Icon(Icons.add_box )),

          ]),
      body: SafeArea(
        child: calView ? _buildCalView(entries):PageView.builder(
          controller:controller ,
            itemCount: entries.length+1,
            itemBuilder: (_,index){
          return JournalEntryPage(today: index == entries.length,entry: index < entries.length ? entries[index] : null,);
        }),
      ),
    );
  }

  _buildCalView(List<JournalEntry> entries) {
    return JournalCalendar(entries);
  }
}
