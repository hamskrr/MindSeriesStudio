import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:mindseries/components%20/appBar.dart';
import 'package:mindseries/misc/MSColors.dart';
import 'package:mindseries/navigation_control.dart';
import 'package:mindseries/pages/authentication/login.dart';
import 'package:mindseries/pages/homepage/journal.dart';
import 'package:mindseries/pages/homepage/moodtrackerentries.dart';
import 'package:mindseries/pages/homepage/moodtrackergreeting.dart';
import 'package:mindseries/providers/auth_provider.dart';

import '../../components /profile_avatar.dart';
import '../../providers/profile_context.dart';
import 'inspo_page.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class NavItem {
  IconData icon;
  Widget page;
  String? label;
  Color? activeColor;
  Color? defaultColor;

  NavItem(
      {required this.icon,
      required this.page,
      this.label,
      this.activeColor = MSColors.action,
      this.defaultColor});
}

class _HomepageState extends State<Homepage> {
  List<NavItem> items = [
  ];
  late NavItem currentPage;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    setState(() {
      items = [
        NavItem(icon: Icons.book, page: JournalPage()),
        NavItem(icon: Icons.bar_chart, page: MoodTrackerGreetingPage()),
        NavItem(icon: Icons.add_box, page: JournalPage()),
        NavItem(icon: Icons.chat_bubble, page: JournalPage()),
      ];
      currentPage = items[1];
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

        body: _buildBody());
  }

  _buildBody() {
    print(ProfileContext.of(context).profile.uid);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child:
      Stack(
        children: [currentPage.page,_buildNav()

        ],
      ),
      // Column(
      //   children: [
      //    Expanded( flex: 8,child: _buildInspo()),
      //
      //     Expanded(child:_buildNav()),
      //
      //   ],
      // ),
    );
  }


  _buildNav() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: kBottomNavigationBarHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...items
                .map((item) => Expanded(child: _buildNavItem(item)))
                .toList(),
            Expanded(child: ProfileAvatar())
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(NavItem item) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: (){
            setState(() {
              currentPage=item;
            });
            //NavigationControl(nextPage: item.page).navTo(context);
          }, icon: Icon(item.icon,color: currentPage==item  ? item.activeColor:item.defaultColor,))
        ]);
  }
}
