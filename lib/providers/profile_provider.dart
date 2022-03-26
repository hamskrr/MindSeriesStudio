import 'package:flutter/material.dart';
import 'package:mindseries/models/profile.dart';

import '../models/auth_service.dart';
import '../models/db_service.dart';
import 'profile_context.dart';

///This class is the main Re-director of the application
///This is where the initial decision to go to the SplashScreen or authentication is made
///If a user is currently signed in they'll be taking to the main page, in contrast they'll be taking to the login page

class ProfileProvider extends InheritedWidget {
  final ProfileContextState? currentProfile;

  const ProfileProvider({Key? key, required Widget child, this.currentProfile})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static ProfileProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ProfileProvider>();
  }
}
