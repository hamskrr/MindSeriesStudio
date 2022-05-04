
import 'package:mindseries/models/profile.dart';
import 'package:uuid/uuid.dart';

import 'FakeFireAuth.dart';

class StaticProfiles {
  static Profile TESTER() => Profile(
        uid:Uuid().v1(),
        username:"tester",
        fname:"test",
        lname:"One",

    );

  static FireAuthModel TESTUSER()=>FireAuthModel(uuid: 'TestUser1',email:'00000000@studentmail.ul.ie',dummypassword: 'DummyPassword123');
  static FireAuthModel TESTUSER2()=>FireAuthModel(uuid: 'TestUser2',email:'1111111111@studentmail.ul.ie',dummypassword: 'DummyPassword321');
  static FireAuthModel ADMINUSER()=>FireAuthModel(uuid: 'J9vf9Bx1f1YdVlebvlO9kKntbLF3',email:'olamidepeters@gmail.com',dummypassword: 'Sonyerics12');

}