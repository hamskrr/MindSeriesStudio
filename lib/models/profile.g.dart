// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map json) => Profile(
      uid: json['uid'] as String? ?? "",
      email: json['email'] as String? ?? "",
      username: json['username'] as String? ?? "",
      fname: json['fname'] as String? ?? "",
      lname: json['lname'] as String? ?? "",
      picture: json['picture'] as String?,
      phone: json['phone'] as String?,
      is2fa: json['is2fa'] as bool? ?? false,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'uid': instance.uid,
      'username': instance.username,
      'email': instance.email,
      'fname': instance.fname,
      'lname': instance.lname,
      'picture': instance.picture,
      'phone': instance.phone,
      'is2fa': instance.is2fa,
    };
