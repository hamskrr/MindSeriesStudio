import 'package:json_annotation/json_annotation.dart';

part 'setting.g.dart';

@JsonSerializable(anyMap: true)
class Setting{
  bool darkmode;
  String? language;
 bool notification;
 int? rating;

  Setting({this.darkmode = true, this.language = "en_US", this.notification = false, this.rating = 0});
  factory Setting.fromJson(Map<String, dynamic> json) =>
      _$SettingFromJson(json);

  Map<String, dynamic> toJson() => _$SettingToJson(this);
}