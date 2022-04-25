import 'package:flutter/material.dart';

import '../models/profile.dart';
import 'profile_provider.dart';

class ProfileContext extends StatefulWidget {
  final Widget child;
  final Profile profile;
  const ProfileContext({Key? key, required this.child, required this.profile}) : super(key: key);
  static ProfileContextState of(BuildContext context){
    print(context.dependOnInheritedWidgetOfExactType<ProfileProvider>());
    return (context.dependOnInheritedWidgetOfExactType<ProfileProvider>() as ProfileProvider).currentProfile!;
  }
  @override
  ProfileContextState createState() => ProfileContextState(profile: this.profile);
}

class ProfileContextState extends State<ProfileContext> {
  Profile profile;
  ProfileContextState({required this.profile});
  void updateProfile({required Profile profile}){
    setState(() {
      this.profile=profile;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ProfileProvider(
      currentProfile:this,
      child: widget.child,
    );
  }
}
