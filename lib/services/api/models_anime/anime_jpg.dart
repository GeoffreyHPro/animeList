import 'package:json_annotation/json_annotation.dart';

part 'anime_jpg.g.dart';

@JsonSerializable()
class AnimeJpg {
  @JsonKey(name: "image_url")
  final String url;

  AnimeJpg({required this.url});

  factory AnimeJpg.fromJson(Map<String, dynamic> json) =>
      _$AnimeJpgFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeJpgToJson(this);
}
