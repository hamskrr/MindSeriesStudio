import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mindseries/models/journal_entry.dart';
import 'package:mindseries/models/profile.dart';

abstract class IDB{
  saveProfile({required Profile profile});
 retrieveProfile({required String uid});
  Future<bool?> addJournalEntry({required String uid,required JournalEntry entry});
  Stream<List<JournalEntry>> retrieveJournal({required String uid});
  Future<JournalEntry?> retrieveJournalEntry({required String uid,required String id});
}
class FireDB implements IDB{
  @override
  saveProfile({required Profile profile}) async{
    // TODO: implement saveProfile
    try{
         print(profile.toJson());
         await FirebaseFirestore.instance.collection("Users").doc(profile.uid).set(profile.toJson());
         print("done");
      return true;
    }catch(e){
      print(e);
      return false;
    }

  }


  Future<JournalEntry?> retrieveJournalEntry({required String uid,required String id}) async{
    // TODO: implement saveProfile
    JournalEntry? entry;
    try{

      final snapshot = await FirebaseFirestore.instance.collection("UserJournal").doc(uid).collection("Entries").doc(id).get();
      entry = JournalEntry.fromJson(snapshot.data()!);


    }catch(e){
      print(e);

    }
    return entry;
  }
  Future<bool?> addJournalEntry({required String uid,required JournalEntry entry}) async{
    // TODO: implement saveProfile
    try{

      final snapshot = await FirebaseFirestore.instance.collection("UserJournal").doc(uid).collection("Entries").doc(entry.id).set(entry.toJson());

    }catch(e){
      print(e);
      return false;
    }
    return true;
  }
  Stream<List<JournalEntry>> retrieveJournal({required String uid}){
    {
      StreamController<List<JournalEntry>> streamController = StreamController();
      Stream<List<JournalEntry>> journalStream = streamController.stream;

      // return FirebaseAuth.instance.authStateChanges();

     FirebaseFirestore.instance.collection("UserJournal").doc(uid).collection("Entries").snapshots().listen((event) {
       List<JournalEntry> entries = [];
       final snapshot = event.docs;
       snapshot.forEach((element) {
         entries.add(JournalEntry.fromJson(element.data()));
       });

          streamController.add(entries);


      });
      return journalStream;
    }

  }
  Future<Profile?> retrieveProfile({required String uid}) async{
    // TODO: implement saveProfile
    Profile? profile;
    try{

      final snapshot = await FirebaseFirestore.instance.collection("Users").doc(uid).get();
      profile = Profile.fromJson(snapshot.data()!);


    }catch(e){
      print(e);

    }
    return profile;
  }

}