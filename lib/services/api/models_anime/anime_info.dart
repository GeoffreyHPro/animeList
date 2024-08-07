import 'package:json_annotation/json_annotation.dart';
import 'package:projet_tm/services/api/models_anime/anime_images.dart';

part 'anime_info.g.dart';

@JsonSerializable()
class AnimeInfo {
  @JsonKey(name: "mal_id")
  final double id;

  final String url;
  @JsonKey(name: "title")
  final String? title;

  @JsonKey(name: "score")
  final double? score;

  @JsonKey(name: "images")
  final AnimeImages? images;

  @JsonKey(name: "year")
  final int? year;

  @JsonKey(name: "type")
  final String? type;

  @JsonKey(name: "episodes")
  final int? episodes;

  @JsonKey(name: "synopsis")
  final String? synopsis;

  AnimeInfo(
      {required this.id,
      required this.url,
      required this.title,
      required this.score,
      required this.images,
      required this.year,
      required this.type,
      required this.episodes,
      required this.synopsis});

  factory AnimeInfo.fromJson(Map<String, dynamic> json) =>
      _$AnimeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeInfoToJson(this);
}
