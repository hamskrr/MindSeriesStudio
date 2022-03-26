import 'package:json_annotation/json_annotation.dart';

part 'journal_entry.g.dart';

@JsonSerializable(anyMap: true)
class JournalEntry{
  num timestamp;
  String id;
  List<String>? grateful;
  List<String>? affirmation;
  String? title;
  String? notes;

  JournalEntry(
      {
        required this.id,
        required this.timestamp,
      this.grateful,
      this.affirmation,
      this.title,
      this.notes});

  factory JournalEntry.fromJson(Map<String, dynamic> json) =>
      _$JournalEntryFromJson(json);

  Map<String, dynamic> toJson() => _$JournalEntryToJson(this);
}