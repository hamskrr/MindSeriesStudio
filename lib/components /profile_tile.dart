import 'package:flutter/material.dart';
import 'package:mindseries/components%20/profile_avatar.dart';
import 'package:mindseries/providers/database_provider.dart';

import '../models/profile.dart';

class ProfileTile extends StatelessWidget {
  final String uid;
  const ProfileTile({required this.uid, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Profile?>(
      future: DBProvider.of(context)?.db?.retrieveProfile(uid: uid),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return Container(
            constraints: BoxConstraints(maxWidth: 200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: ProfileAvatar(image: snapshot.data?.picture,radius: 32,borderColor: Colors.white,borderWidth: 1,)),
                SizedBox(width: 3,),
                Expanded(flex:4,child: Text(snapshot.data?.username != "" ? snapshot.data?.username??"" : snapshot.data?.fname??"",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14
                ),)),
              ],
            ),
          );
        }return Container();

      }
    );
  }
}
