import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:mindseries/components%20/appBar.dart';
import 'package:mindseries/misc/MSColors.dart';
import 'package:mindseries/navigation_control.dart';
import 'package:mindseries/pages/homepage/launguage_page.dart';
import 'package:mindseries/pages/homepage/privacy_statement_page.dart';
import 'package:mindseries/pages/homepage/wellbeing_links_page.dart';
import 'package:mindseries/providers/settingsProvider.dart';
import 'package:provider/provider.dart';

import '../../models/setting.dart';
import '../../providers/profileProvider.dart';



class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  Setting setting = Setting();
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    setting = Provider.of<SettingProvider>(context, listen: false).setting;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MSAppBar.getAppBar(),
      backgroundColor: MSColors.background,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            // SwitchListTile(
            //
            //     title: Text("Dark Mode",style: TextStyle(fontFamily: "Roboto"),),
            //     value:setting.darkmode , onChanged: (b){
            //   setState(() {
            //     setting.darkmode = !setting.darkmode;
            //   });
            //   Provider.of<SettingProvider>(context, listen: false).updateSetting(setting);
            // }),
            ListTile(
              leading: Icon(FontAwesome5.brain),
              title: Text("Well Being Links",style: TextStyle(fontFamily: "Roboto"),),
              trailing: Icon(Icons.chevron_right),
              onTap: (){
                NavigationControl(nextPage: WellBeingLinksPage()).navTo(context);
              },
            ),
            SwitchListTile(

                title: Row(
                  children: [
                    Expanded(child: Icon(FontAwesome5.bell)),
                    Spacer(),
                    Expanded(
                        flex: 7,
                        child: Text("Notification",style: TextStyle(fontFamily: "Roboto"),)),
                  ],
                ),
                value:setting.notification , onChanged: (b){
              setState(() {
                setting.notification = !setting.notification;
              });
              Provider.of<SettingProvider>(context, listen: false).updateSetting(setting);
            }),

            ListTile(
              leading: Icon(FontAwesome5.language),
              title: Text("Languages",style: TextStyle(fontFamily: "Roboto"),),
              trailing: Icon(Icons.chevron_right),
              onTap: (){
                NavigationControl(nextPage: LanguagePage()).navTo(context);
              },
            ),
            ListTile(
              leading: Icon(FontAwesome5.shield_alt),
              title: Text("Privacy and Security",style: TextStyle(fontFamily: "Roboto"),),
              trailing: Icon(Icons.chevron_right),
              onTap: (){
                NavigationControl(nextPage: PrivacyStatement()).navTo(context);
              },
            ),
            ListTile(
              leading: Icon(FontAwesome5.share_alt),
              title: Text("Share the App",style: TextStyle(fontFamily: "Roboto"),),
              trailing: Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }
}
