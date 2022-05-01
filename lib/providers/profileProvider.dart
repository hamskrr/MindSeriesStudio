

import 'package:flutter/material.dart';

import '../models/profile.dart';

class ProfileProvider extends ChangeNotifier{
  Profile? currentProfile;

  void updateProfile(Profile profile) {
    currentProfile = profile;

    notifyListeners();
  }
}