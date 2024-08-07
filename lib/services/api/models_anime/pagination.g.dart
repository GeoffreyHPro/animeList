// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      lastPage: json['last_visible_page'] as int,
      nextPage: json['has_next_page'] as bool,
      currentPage: json['current_page'] as int,
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'last_visible_page': instance.lastPage,
      'has_next_page': instance.nextPage,
      'current_page': instance.currentPage,
    };
