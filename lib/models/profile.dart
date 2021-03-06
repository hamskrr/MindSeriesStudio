import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable(anyMap: true)
class Profile{
  String uid;
  String? username;
  String? email;
  String? fname;
  String? lname;
  String? picture;
  String? phone;
  bool is2fa;

  Profile({this.uid = "",this.email = "",this.username = "",this.fname = "",this.lname = "",this.picture,this.phone,this.is2fa = false});

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  @override
  String toString() {
    return 'Profile{uid: $uid, username: $username, email: $email, fname: $fname, lname: $lname, picture: $picture}';
  }
}
