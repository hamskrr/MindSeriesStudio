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

  Profile({this.uid = "",this.email = "",this.username = "",this.fname = "",this.lname = "",this.picture});

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
