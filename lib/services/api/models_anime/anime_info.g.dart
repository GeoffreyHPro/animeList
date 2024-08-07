// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeInfo _$AnimeInfoFromJson(Map<String, dynamic> json) => AnimeInfo(
      id: (json['mal_id'] as num).toDouble(),
      url: json['url'] as String,
      title: json['title'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      images: json['images'] == null
          ? null
          : AnimeImages.fromJson(json['images'] as Map<String, dynamic>),
      year: json['year'] as int?,
      type: json['type'] as String?,
      episodes: json['episodes'] as int?,
      synopsis: json['synopsis'] as String?,
    );

Map<String, dynamic> _$AnimeInfoToJson(AnimeInfo instance) => <String, dynamic>{
      'mal_id': instance.id,
      'url': instance.url,
      'title': instance.title,
      'score': instance.score,
      'images': instance.images,
      'year': instance.year,
      'type': instance.type,
      'episodes': instance.episodes,
      'synopsis': instance.synopsis,
    };
