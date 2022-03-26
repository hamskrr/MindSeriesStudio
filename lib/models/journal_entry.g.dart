// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'journal_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JournalEntry _$JournalEntryFromJson(Map json) => JournalEntry(
      id: json['id'] as String,
      timestamp: json['timestamp'] as num,
      grateful: (json['grateful'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      affirmation: (json['affirmation'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      title: json['title'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$JournalEntryToJson(JournalEntry instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'id': instance.id,
      'grateful': instance.grateful,
      'affirmation': instance.affirmation,
      'title': instance.title,
      'notes': instance.notes,
    };
