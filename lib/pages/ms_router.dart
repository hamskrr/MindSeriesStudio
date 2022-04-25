import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mindseries/pages/authentication/login.dart';
import 'package:mindseries/pages/homepage/homepage.dart';
import 'package:mindseries/providers/auth_provider.dart';
import 'package:mindseries/providers/database_provider.dart';
import 'package:mindseries/providers/profile_context.dart';
import 'package:mindseries/providers/profile_provider.dart';

import '../models/auth_service.dart';
import '../models/profile.dart';
import 'splash_screen.dart';

class MSRouter extends StatefulWidget {
  const MSRouter({Key? key}) : super(key: key);

  @override
  State<MSRouter> createState() => _MSRouterState();
}

class _MSRouterState extends State<MSRouter> {
  bool isLoggedIn = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Profile?>(
        stream: AuthProvider.of(context)?.auth?.currentUser(),
        builder: (_,userQuery){
        switch(userQuery.connectionState){
          case ConnectionState.waiting:
            return SplashScreen();
          default:
            print(userQuery.data);
              if(userQuery.data == null){
                return LoginPage();
              }else{
                return _buildHome(userQuery.data?.uid);
              }

        }
    });


      isLoggedIn ? Homepage() : const LoginPage();
  }
  _buildHome(uid){
    return FutureBuilder<Profile?>(
        future: DBProvider.of(context)?.db?.retrieveProfile(uid: uid),
        builder: (_,ds){
          switch(ds.connectionState){
            case ConnectionState.waiting:
              return SplashScreen();
            default:

              return ds.data!=null ? ProfileContext(
                profile:ds.data!,
                  child: Homepage()
              ):Container();

          }
    });
  }
}
