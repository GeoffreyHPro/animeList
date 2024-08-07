import 'package:json_annotation/json_annotation.dart';

import 'package:projet_tm/services/api/models_anime/anime_info.dart';
import 'package:projet_tm/services/api/models_anime/pagination.dart';

part 'anime_data.g.dart';

@JsonSerializable()
class AnimeData {
  final List<AnimeInfo> data;
  final Pagination pagination;

  AnimeData({required this.data, required this.pagination});

  factory AnimeData.fromJson(Map<String, dynamic> json) =>
      _$AnimeDataFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeDataToJson(this);
}
