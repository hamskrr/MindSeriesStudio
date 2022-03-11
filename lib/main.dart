import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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

Future<void> main() async {
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MSRouter(),
    // backgroundColor: Color.fromRGBO(21, 34, 56, 1),
  ));
}


