// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mood _$MoodFromJson(Map json) => Mood(
      id: json['id'] as String,
      reaction:
          $enumDecodeNullable(_$MoodTrackerReactionEnumMap, json['reaction']) ??
              MoodTrackerReaction.neutral,
      notes: json['notes'] as String? ?? "",
      actions: json['actions'] ?? const [],
      timestamp: json['timestamp'] as num? ?? 0,
    );

Map<String, dynamic> _$MoodToJson(Mood instance) => <String, dynamic>{
      'id': instance.id,
      'reaction': _$MoodTrackerReactionEnumMap[instance.reaction],
      'notes': instance.notes,
      'actions': instance.actions,
      'timestamp': instance.timestamp,
    };

const _$MoodTrackerReactionEnumMap = {
  MoodTrackerReaction.miserable: 'miserable',
  MoodTrackerReaction.sad: 'sad',
  MoodTrackerReaction.neutral: 'neutral',
  MoodTrackerReaction.good: 'good',
  MoodTrackerReaction.great: 'great',
};
