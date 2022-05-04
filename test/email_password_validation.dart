
import 'package:flutter_test/flutter_test.dart';

import '../Testing/Mocks/AuthenticatorMock.dart';
import '../Testing/Mocks/static_profiles.dart';

void main() {
  Validator v=Validator();
  test('Empty Email Test',()=>expect(_emptyEmailTest(v), false));
  test('Empty Password Test',()=>expect(_emptyPasswordTest(v), false));
  test('InValid Email Test',()=>expect(_invalidEmailTest(v), false));
  test('Invalid Password Test',()=>expect(_invalidPasswordTest(v), false));
  test('Valid Email Test',()=>expect(_validEmailTest(v), false));
  test('valid Password Test',()=>expect(_validPasswordTest(v), true));
  test('valid Credentials Test',()=>expect(_validCredentials(), StaticProfiles.TESTUSER().uuid));
  test('invalid Credentials Test',()=>expect(_invalidCredentials(), null));
}

class Validator {
  validateEmail(String s) {}

  validatePassword(String s) {}
  
}
_validCredentials(){
  return AuthMock().login('00000000@studentmail.ul.ie', 'DummyPassword123');
}
_invalidCredentials(){
  return AuthMock().login('00000000@studentmail.ul.ie', 'Dummy123');
}
_emptyEmailTest(Validator v){
    return v.validateEmail('');
}
_emptyPasswordTest(Validator v){
  return v.validatePassword('');
}
_invalidEmailTest(Validator v){

 return v.validateEmail('21343');

}
_invalidPasswordTest(Validator v){

    return v.validatePassword('sorry12');

}
_validEmailTest(Validator v){

  return v.validateEmail('161593813@studentmail.ul.ie');

}
_validPasswordTest(Validator v){

  return v.validatePassword('sorryBoss12');

}