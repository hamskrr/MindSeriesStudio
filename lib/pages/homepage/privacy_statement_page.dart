import 'package:flutter/material.dart';
import 'package:mindseries/components/appBar.dart';
import 'package:mindseries/misc/MSColors.dart';
import 'package:mindseries/providers/profileProvider.dart';
import 'package:provider/provider.dart';

import '../../models/profile.dart';

class PrivacyStatement extends StatefulWidget {
  const PrivacyStatement({Key? key}) : super(key: key);

  @override
  State<PrivacyStatement> createState() => _PrivacyStatementState();
}

class _PrivacyStatementState extends State<PrivacyStatement> {
  @override
  Widget build(BuildContext context) {
    final statement = "";
    Profile me = Provider.of<ProfileProvider>(context,listen:false).currentProfile!;
    return Scaffold(
      appBar: MSAppBar.getAppBar(title: Text("Privacy and Security", style: TextStyle(
          fontFamily: "Roboto"
      ),)),
      backgroundColor: MSColors.background,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
                  SwitchListTile(
                    title: Text(me.phone ==null ? "No Phone Provided": me.phone!.replaceRange(0,(me.phone?.length??"000".length)-3 , "*"*((me.phone?.length??6)-3))),
                    subtitle: Text(me.phone == null ? "Add your phone number in the profile please!" :"Enable Two-factor-authentication"), value: me.is2fa,
                    onChanged: me.phone == null ? null : (b){
                     setState(() {
                       me.is2fa = !me.is2fa;
                     });
                     Provider.of<ProfileProvider>(context).updateProfile(me);
                    },
                  ),
              Container(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: "Roboto"
                    ),
                    children: [
                      TextSpan(
                        text: statement
                      )
                    ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
