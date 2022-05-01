import 'package:json_annotation/json_annotation.dart';

part 'feed.g.dart';

@JsonSerializable(anyMap: true)
class Feed{
  final String id;
  final String uploader;
  final String link;
  final ContentType contentType;
  String? title;
  String? description;
  List<String> likes;
  num? views;
  List<String>? comments;
  String? shareLink;
  num timestamp;

  Feed(
      {
        required this.id,
        required this.uploader,
        required this.link,
        required this.contentType,
      this.title,
      this.description,
        this.timestamp = 0,
      this.likes = const [],
      this.views = 0,
      this.comments = const [],
      this.shareLink});

  factory Feed.fromJson(Map<String, dynamic> json) =>
      _$FeedFromJson(json);

  Map<String, dynamic> toJson() => _$FeedToJson(this);
}
enum ContentType{
  video,
  image
}