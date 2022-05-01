// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Setting _$SettingFromJson(Map json) => Setting(
      darkmode: json['darkmode'] as bool? ?? true,
      language: json['language'] as String? ?? "en_US",
      notification: json['notification'] as bool? ?? false,
      rating: json['rating'] as int? ?? 0,
    );

Map<String, dynamic> _$SettingToJson(Setting instance) => <String, dynamic>{
      'darkmode': instance.darkmode,
      'language': instance.language,
      'notification': instance.notification,
      'rating': instance.rating,
    };
