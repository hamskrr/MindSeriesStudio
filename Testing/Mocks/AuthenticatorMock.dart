

import 'static_profiles.dart';

class AuthMock {

  String login(email,password) {
    return findUser(email, password);
  }
  findUser(email,pass){
    String? uid;
    if(StaticProfiles.TESTUSER().email==email&&StaticProfiles.TESTUSER().dummypassword==pass)
      uid=StaticProfiles.TESTUSER().uuid;
    else if(StaticProfiles.TESTUSER2().email==email&&StaticProfiles.TESTUSER2().dummypassword==pass)
      uid=StaticProfiles.TESTUSER2().uuid;
    return uid;
  }
}