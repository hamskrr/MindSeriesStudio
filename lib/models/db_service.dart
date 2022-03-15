import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mindseries/models/profile.dart';

abstract class IDB{
  saveProfile({required Profile profile});
 retrieveProfile({required String uid});
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