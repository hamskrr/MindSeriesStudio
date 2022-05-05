import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mindseries/models/db_service.dart';
import 'package:mindseries/models/profile.dart';
import 'package:mindseries/navigation_control.dart';
import 'package:mindseries/pages/authentication/login.dart';
import 'package:mindseries/providers/database_provider.dart';
///This is an interface that allows jus to plug and play different types of authentication services
abstract class IAuth {
  Future<dynamic> signInWithEmailAndPassword(String email, String password);
  Future<dynamic> signInWithGoogle();

  Future<dynamic> signInWithUsernameAndPassword(String name, String password);

  Future<dynamic> createUserWithEmailAndPassword(String email, String password);

  Stream<Profile?> currentUser();

  Future<String?> getUser();

  Future<void> signOut();

  Future<bool> forgotPassword(String email);
}
enum AuthStatus {
  notDetermined,
  notSignedIn,
  signedIn,
}


class FireAuth implements IAuth{
  @override
  Future createUserWithEmailAndPassword(String email, String password) async{
    final fa = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    return fa.user?.uid??"";
  }

  @override
  Future<Profile> signInWithGoogle()async{
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final uid = (await FirebaseAuth.instance.signInWithCredential(credential)).user?.uid;
      // Once signed in, return the UserCredential
      Profile profile = Profile(uid: uid??"" ,username: googleUser?.displayName,email: googleUser?.email,fname: googleUser?.displayName,picture: googleUser?.photoUrl );
      return profile;

  }

  Future<String?> getUser() async{
    final event =  FirebaseAuth.instance.currentUser;
    return event?.uid;
  }
  @override
  Stream<Profile?> currentUser() {
    StreamController<Profile?> streamController = StreamController();
   Stream<Profile?> userStream = streamController.stream;

   // return FirebaseAuth.instance.authStateChanges();

      FirebaseAuth.instance.authStateChanges().listen((event) {
      if (kDebugMode) {
        print("AUTH CHANGE");
        print(event);
      }
      Profile? profile;
      if(event != null){
       FireDB db = FireDB();
       db.retrieveProfile(uid:event.uid).then((p){
         profile = p;
         streamController.add(profile);
       });
      }else{
        print("--");
        streamController.add(profile);

      }
    });
    return userStream;
  }

  @override
  Future<bool> forgotPassword(String email) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future signInWithEmailAndPassword(String email, String password) async{
    final fa = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return fa.user?.uid??"";
  }

  @override
  Future signInWithUsernameAndPassword(String name, String password) {
    // TODO: implement signInWithUsernameAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async{
    FirebaseAuth.instance.signOut();
  }


}