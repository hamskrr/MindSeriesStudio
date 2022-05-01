import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:intl/intl.dart';
import 'package:mindseries/components%20/appBar.dart';
import 'package:mindseries/misc/MSColors.dart';
import 'package:mindseries/misc/color_misc.dart';
import 'package:mindseries/models/mood.dart';
import 'package:mindseries/pages/homepage/moodtrackerentries.dart';
import 'package:provider/provider.dart';

import '../../navigation_control.dart';
import '../../providers/database_provider.dart';
import '../../providers/profileProvider.dart';

class MoodTrackerGreetingPage extends StatefulWidget {
  @override
  State<MoodTrackerGreetingPage> createState() =>
      _MoodTrackerGreetingPageState();
}

class _MoodTrackerGreetingPageState extends State<MoodTrackerGreetingPage> {
  bool addMode = false;
  bool loading = false;
  MoodTrackerReaction reaction = MoodTrackerReaction.neutral;
  TextEditingController notes = TextEditingController();
  TextEditingController newMindful = TextEditingController();
  List<String> mindfullMoods = [
    "Music",
    "Walk",
    "Call a Friend",
    "Watch a movie",
  ];
  List<String> selectedMindfullMood = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MSAppBar.getAppBar(actions: [
        IconButton(
          onPressed: () {
            print(Provider.of<ProfileProvider>(context,listen: false).currentProfile?.fname);
            NavigationControl(nextPage: MoodTrackerEntriesPage())
                .navTo(context);
          },
          icon: Icon(Icons.line_style),
        )
      ]),
      backgroundColor: Color.fromRGBO(21, 34, 56, 1),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Hi Username
            Container(
                height: 30,
                // color: Colors.white,
                child: Row(
                  children: [
                    Text(
                      'Hi ${ Provider.of<ProfileProvider>(context, listen: false).currentProfile?.username??""}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Cabin'),
                    )
                  ],
                )),

            SizedBox(
              height: 15,
            ),

            //text
            Container(
                //    color: Colors.white,
                child: Text(
              'Taking note of how you feel will help you identify and regulate moods',
              maxLines: 2,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1),
            )),

            SizedBox(
              height: 30,
            ),

            //How are you feeling
            Container(
                height: 30,
                //     color: Colors.white,
                child: Row(
                  children: [
                    Text(
                      'How are you feeling today?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Cabin'),
                    )
                  ],
                )),

            SizedBox(
              height: 30,
            ),

            //emoji moods
            Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: MoodTrackerReaction.values
                        .map(
                          (e) => InkWell(
                            onTap: () {
                              setState(() {
                                reaction = e;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                  color: reaction == e
                                      ? MSColors.card
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: reaction == e
                                          ? Colors.white70
                                          : Colors.transparent),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.all(reaction == e ? 5 : 0),
                              child: Icon(
                                e.icon,
                                color: e.color,
                                size: 30.0,
                              ),
                            ),
                          ),
                        )
                        .toList())),

            SizedBox(
              height: 15,
            ),

            //Moments text
            Container(
                child: Row(
              children: [
                Text(
                  'Note',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Cabin'),
                )
              ],
            )),

            SizedBox(
              height: 15,
            ),

            //Moments textbox
            Container(
                //textfield lets you edit
                child: TextField(
              keyboardType: TextInputType.text,
              maxLines: 3,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  hintText: 'add note...',
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )),
            )),

            SizedBox(
              height: 30,
            ),

            //Mindful Mood
            Container(
                child: Row(
              children: [
                Text(
                  'Mindful Mood',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Cabin'),
                )
              ],
            )),

            SizedBox(
              height: 10,
            ),

            //what actions ...
            Container(
                child: Text(
              'What actionn are you going to take to better your mood?',
              maxLines: 2,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            )),

            SizedBox(
              height: 15,
            ),

            //mindful mood images
            Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    addMode
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 150,
                              alignment: Alignment.center,
                              child: TextField(
                                controller: newMindful,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 12),
                                    hintText: "Enter Mood",
                                    isDense: true,
                                    border: OutlineInputBorder(),
                                    suffix: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (mindfullMoods
                                                .contains(newMindful.text)) {
                                              mindfullMoods
                                                  .remove(newMindful.text);
                                            } else {
                                              mindfullMoods.insert(
                                                  0, newMindful.text);
                                            }
                                          });
                                          newMindful.clear();
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        )),
                                    fillColor: Colors.grey[200],
                                    filled: true),
                              ),
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                addMode = true;
                              });
                            },
                            icon: Icon(
                              Icons.add,
                              color: Colors.black,
                            )),
                    ...mindfullMoods.map((m) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ChoiceChip(
                            backgroundColor: ColorMisc.withTint(
                                ColorMisc.nameToColor(m), 0.6),
                            selectedColor:
                                ColorMisc.withTint(ColorMisc.nameToColor(m), 0),
                            disabledColor:
                                ColorMisc.nameToColor(m).withOpacity(0.6),
                            onSelected: (b) {
                              setState(() {
                                if (selectedMindfullMood.contains(m)) {
                                  selectedMindfullMood.remove(m);
                                } else {
                                  selectedMindfullMood.insert(0, m);
                                }
                              });
                            },
                            label: Text(
                              m,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(
                                      selectedMindfullMood.contains(m)
                                          ? 1
                                          : 0.6),
                                  fontWeight: FontWeight.bold),
                            ),
                            selected: selectedMindfullMood.contains(m)),
                      );
                    }).toList()
                  ],
                )),

            SizedBox(
              height: 25,
            ),

            //close button
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${DateFormat.yMMMd().format(DateTime.now())}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Cabin'),
                  ),
                  loading
                      ? Container(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            saveMood();
                          },
                          child: Text(
                            'Save',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Cabin'),
                          ))
                ],
              ),
            ),

            SizedBox(
              height: 30,
            ),

            //save button
          ],
        ),
      ),
    );
  }

  void saveMood() async {
    // add
    final today = DateTime.now();
    final todayStart = DateTime(today.year, today.month, today.day);
    Mood mood = Mood(
        id: "${todayStart.millisecondsSinceEpoch}",
        reaction: reaction,
        notes: notes.text,
        actions: selectedMindfullMood,
        timestamp: today.millisecondsSinceEpoch);
    setState(() {
      loading = true;
    });
    await DBProvider.of(context)
        ?.db
        ?.addMood(uid: Provider.of<ProfileProvider>(context,listen:false).currentProfile?.uid??"", mood: mood);
    setState(() {
      loading = false;
    });
  }
}
