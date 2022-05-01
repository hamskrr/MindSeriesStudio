import 'package:flutter/material.dart';
import 'package:mindseries/components%20/appBar.dart';
import 'package:mindseries/misc/MSColors.dart';
import 'package:mindseries/providers/settingsProvider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/setting.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    Setting setting = Provider.of<SettingProvider>(context,listen: false).setting;
    final languages = {
      "English(US)":"en_US",
      "French":"fr_FR"
    };
    return Scaffold(
      appBar: MSAppBar.getAppBar(
          title: Text("Language",style: TextStyle(fontFamily: "Roboto",))
      ),
      backgroundColor: MSColors.background,
      body: Container(
          child: ListView(children: languages.keys.map((value) =>
              ListTile(
                title: Text(value,style: TextStyle(fontFamily: "Roboto"),),
                trailing: setting.language == languages[value] ? Icon(Icons.check_circle) : Icon(Icons.circle,color: Colors.white60,),
                onTap: (){
                  setState(() {
                    setting.language = languages[value];
                  });
                  Provider.of<SettingProvider>(context,listen: false).updateSetting(setting);
                },
              )).toList().cast<Widget>())
      ),
    );
  }

  void _launchUrl(url) async {

    final _url = Uri.parse(url);
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }
}
