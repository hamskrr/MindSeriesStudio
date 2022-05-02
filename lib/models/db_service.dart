import 'dart:async';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mindseries/models/journal_entry.dart';
import 'package:mindseries/models/profile.dart';
import 'package:path/path.dart';

import 'feed.dart';
import 'mood.dart';

abstract class IDB{
  saveProfile({required Profile profile});
 retrieveProfile({required String uid});
 Future<String> uploadImage(String uid,Uint8List bytes,{String? filename});
  Future<bool?> addJournalEntry({required String uid,required JournalEntry entry});
  Future<bool?> addMood({required String uid,required Mood mood});
  Future<bool?> uploadFeed({required Feed feed});
  Stream<List<JournalEntry>> retrieveJournal({required String uid});
  Stream<List<Mood>> retrieveMoods({required String uid, required num from,required num to});
  Stream<List<Feed>> retrieveFeeds();
  Future<JournalEntry?> retrieveJournalEntry({required String uid,required String id});
}
class FireDB implements IDB{
  List<Feed> currentFeed = [];
  @override
  saveProfile({required Profile profile}) async{
    // TODO: implement saveProfile
    try{

         await FirebaseFirestore.instance.collection("Users").doc(profile.uid).set(profile.toJson());
         print("done");
      return true;
    }catch(e){
      print(e);
      return false;
    }

  }
  Future<String> uploadImage(String uid,Uint8List bytes,{String? filename}) async {

    final fileName = basename(filename??"${DateTime.now().millisecondsSinceEpoch}_IMG");
    final destination = 'files/$fileName';

    try {
      final ref =  FirebaseStorage.instance
          .ref(destination)
          .child('$uid');
     await ref.putData(bytes);
      final url = await FirebaseStorage.instance
          .ref(destination).child('$uid')
          .getDownloadURL();
      print(url);
      return url;
    } catch (e) {
      print('error occured $e');
      return "";
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
  Future<bool?>  addMood({required String uid,required Mood mood}) async{
    // TODO: implement saveProfile
    try{

      final snapshot = await FirebaseFirestore.instance.collection("UserJournal").doc(uid).collection("MoodTracker").doc(mood.id).set(mood.toJson());

    }catch(e){
      print(e);
      return false;
    }
    return true;
  }
  Future<bool?>  uploadFeed({required Feed feed}) async{
    // TODO: implement saveProfile
    try{

      final snapshot = await FirebaseFirestore.instance.collection("Feed").doc(feed.id).set(feed.toJson());

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
  Stream<List<Mood>> retrieveMoods({required String uid,required num from,required num to}){
    {
      StreamController<List<Mood>> streamController = StreamController();
      Stream<List<Mood>> journalStream = streamController.stream;

      // return FirebaseAuth.instance.authStateChanges();
print(from);
print(to);
      FirebaseFirestore.instance.collection("UserJournal")
          .doc(uid)
          .collection("MoodTracker").orderBy("timestamp")
          .where("timestamp", isGreaterThanOrEqualTo: from, isLessThanOrEqualTo: to)
          .snapshots().listen((event) {
        List<Mood> entries = [];
        final snapshot = event.docs;
        snapshot.forEach((element) {
          entries.add(Mood.fromJson(element.data()));
        });

        streamController.add(entries);

      });
      return journalStream;
    }

  }
  Stream<List<Feed>> retrieveFeeds(){
    {
      StreamController<List<Feed>> streamController = StreamController();
      Stream<List<Feed>> journalStream = streamController.stream;

      // return FirebaseAuth.instance.authStateChanges();

      FirebaseFirestore.instance
          .collection("Feed")
      .orderBy("timestamp")
      .limit(20)
          .snapshots().listen((event) {

        List<Feed> entries = [];
        final snapshot = event.docs;

        snapshot.forEach((element) {

          entries.add(Feed.fromJson(element.data()));
        });
        currentFeed = entries;
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