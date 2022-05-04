import 'package:flutter/material.dart';
import 'package:mindseries/components/appBar.dart';
import 'package:mindseries/misc/MSColors.dart';
import 'package:url_launcher/url_launcher.dart';

class WellBeingLinksPage extends StatelessWidget {
  const WellBeingLinksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final WellBeingLinks = {
      "Title":"https://google.com"
    };
    return Scaffold(
      appBar: MSAppBar.getAppBar(
        title: Text("Well-being Links",style: TextStyle(fontFamily: "Roboto",))
      ),
      backgroundColor: MSColors.background,
      body: Container(
        child: ListView(children: WellBeingLinks.keys.map((value) =>
            ListTile(
              title: Text(value,style: TextStyle(fontFamily: "Roboto"),),
              trailing: Text("visit »",style: TextStyle(fontFamily: "Roboto",),),
              onTap: (){
                _launchUrl(WellBeingLinks[value]);
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
