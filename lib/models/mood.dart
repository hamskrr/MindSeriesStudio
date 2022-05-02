import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mood.g.dart';
@JsonSerializable(anyMap: true)
class Mood{
  String id;
  MoodTrackerReaction? reaction;
  String? notes;
  List<String>? actions;
  num timestamp;

  Mood({required this.id,this.reaction = MoodTrackerReaction.neutral,this.notes="",actions=const [],this.timestamp = 0});
  factory Mood.fromJson(Map<String, dynamic> json) =>
      _$MoodFromJson(json);

  Map<String, dynamic> toJson() => _$MoodToJson(this);

}

enum MoodTrackerReaction{
  miserable,
  sad,
  neutral,
  good,
  great
}
extension MoodTrackerExtn on MoodTrackerReaction{
   String get name {
     switch(this){

       case MoodTrackerReaction.miserable:
         return "Miserable";
       case MoodTrackerReaction.sad:
        return "Sad";
       case MoodTrackerReaction.neutral:
         return "Neutral";
       case MoodTrackerReaction.good:
        return "Good";
       case MoodTrackerReaction.great:
         return "Great";
     }
   }
   double get value {
     switch(this){

       case MoodTrackerReaction.miserable:
         return 1;
       case MoodTrackerReaction.sad:
        return 2;
       case MoodTrackerReaction.neutral:
         return 3;
       case MoodTrackerReaction.good:
        return 4;
       case MoodTrackerReaction.great:
         return 5;
     }
   }
   IconData get icon {
     switch(this){

       case MoodTrackerReaction.miserable:
         return FontAwesome5.angry;
       case MoodTrackerReaction.sad:
         return FontAwesome5.frown;
       case MoodTrackerReaction.neutral:
         return FontAwesome5.meh_blank;
       case MoodTrackerReaction.good:
         return FontAwesome5.smile_beam;
       case MoodTrackerReaction.great:
         return FontAwesome5.laugh;
     }
   }
   Color get color {
     switch(this){

       case MoodTrackerReaction.miserable:
         return Colors.red;
       case MoodTrackerReaction.sad:
         return Colors.amber;
       case MoodTrackerReaction.neutral:
         return Colors.grey;
       case MoodTrackerReaction.good:
         return Colors.green;
       case MoodTrackerReaction.great:
         return Colors.purpleAccent;
     }
   }
}