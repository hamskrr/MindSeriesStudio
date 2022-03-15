import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mindseries/Theme/app_theme.dart';
import 'package:mindseries/models/auth_service.dart';
import 'package:mindseries/models/db_service.dart';
import 'package:mindseries/pages/authentication/CheckMail.dart';
import 'package:mindseries/pages/authentication/CreateNewPassword.dart';
import 'package:mindseries/pages/authentication/ForgotPassword.dart';
import 'package:mindseries/pages/authentication/login.dart';
import 'package:mindseries/pages/authentication/SignUpFormPage.dart';
import 'package:mindseries/pages/homepage/Calendar.dart';
import 'package:mindseries/pages/homepage/account.dart';
import 'package:mindseries/pages/homepage/homepage.dart';
import 'package:mindseries/pages/homepage/journal.dart';
import 'package:mindseries/pages/homepage/journalentries.dart';
import 'package:mindseries/pages/homepage/moodtrackerentries.dart';
import 'package:mindseries/pages/homepage/moodtrackergreeting.dart';
import 'package:mindseries/pages/homepage/settings.dart';
import 'package:mindseries/pages/ms_router.dart';
import 'package:mindseries/providers/auth_provider.dart';
import 'package:mindseries/providers/database_provider.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MSApp());
}

class MSApp extends StatefulWidget {
  const MSApp({Key? key}) : super(key: key);

  @override
  _MSAppState createState() => _MSAppState();
}

class _MSAppState extends State<MSApp> {
  @override
  Widget build(BuildContext context) {
   return AuthProvider(
            auth: FireAuth(),
            child: DBProvider(
            db: FireDB(),
       child: MaterialApp(
         theme: Themes.darkTheme,
              home: MSRouter(),
              // backgroundColor: Color.fromRGBO(21, 34, 56, 1),
            ),
          ));

  }
}



