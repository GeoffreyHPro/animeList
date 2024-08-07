// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeData _$AnimeDataFromJson(Map<String, dynamic> json) => AnimeData(
      data: (json['data'] as List<dynamic>)
          .map((e) => AnimeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeDataToJson(AnimeData instance) => <String, dynamic>{
      'data': instance.data,
      'pagination': instance.pagination,
    };
