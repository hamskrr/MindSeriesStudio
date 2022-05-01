// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feed _$FeedFromJson(Map json) => Feed(
      id: json['id'] as String,
      uploader: json['uploader'] as String,
      link: json['link'] as String,
      contentType: $enumDecode(_$ContentTypeEnumMap, json['contentType']),
      title: json['title'] as String?,
      description: json['description'] as String?,
      timestamp: json['timestamp'] as num? ?? 0,
      likes:
          (json['likes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      views: json['views'] as num? ?? 0,
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      shareLink: json['shareLink'] as String?,
    );

Map<String, dynamic> _$FeedToJson(Feed instance) => <String, dynamic>{
      'id': instance.id,
      'uploader': instance.uploader,
      'link': instance.link,
      'contentType': _$ContentTypeEnumMap[instance.contentType],
      'title': instance.title,
      'description': instance.description,
      'likes': instance.likes,
      'views': instance.views,
      'comments': instance.comments,
      'shareLink': instance.shareLink,
      'timestamp': instance.timestamp,
    };

const _$ContentTypeEnumMap = {
  ContentType.video: 'video',
  ContentType.image: 'image',
};
