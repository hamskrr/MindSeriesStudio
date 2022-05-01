import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:mindseries/components%20/appBar.dart';
import 'package:mindseries/misc/MSColors.dart';
import 'package:mindseries/navigation_control.dart';
import 'package:mindseries/pages/authentication/login.dart';
import 'package:mindseries/pages/homepage/feed_upload.dart';
import 'package:mindseries/pages/homepage/journal.dart';
import 'package:mindseries/pages/homepage/moodtrackerentries.dart';
import 'package:mindseries/pages/homepage/moodtrackergreeting.dart';
import 'package:mindseries/pages/homepage/profile_page.dart';
import 'package:mindseries/pages/homepage/settings_page.dart';
import 'package:mindseries/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../components /profile_avatar.dart';
import '../../providers/profileProvider.dart';
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

class _HomepageState extends State<Homepage> with AutomaticKeepAliveClientMixin{
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
        NavItem(icon: Icons.settings, page: SettingPage()),
        NavItem(icon: Icons.book, page: JournalPage()),
        NavItem(icon: Icons.lightbulb, page: InspoPage()),
        NavItem(icon: Icons.bar_chart, page: MoodTrackerGreetingPage()),

      ];
      currentPage = items[2];
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

        body: _buildBody());
  }

  _buildBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child:
      Stack(
        children: [
          currentPage.page,_buildNav(),
          currentPage == items[2] ? Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top:48.0),
              child: IconButton(
                icon: Icon(Icons.add_box_rounded,size: 30,),
                onPressed: () { NavigationControl(nextPage: FeedUpload()).navTo(context); },
              ),
            ),
          ) : Container()
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
        margin: const EdgeInsets.symmetric(horizontal: 1),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: kBottomNavigationBarHeight+20,
        decoration: BoxDecoration(
          color:currentPage == items[2] ? Colors.black54 : Color(  0xff395A92),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)
          )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...items
                .map((item) => Expanded(child: _buildNavItem(item)))
                .toList(),
            Expanded(child: InkWell(
              onTap: ()=>NavigationControl(nextPage: ProfilePage()).navTo(context),
                child: ProfileAvatar(radius: 30,)))
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
