import 'package:json_annotation/json_annotation.dart';
import 'package:projet_tm/services/api/models_anime/anime_jpg.dart';


part 'anime_images.g.dart';

@JsonSerializable()
class AnimeImages {
  @JsonKey(name: "jpg")
  final AnimeJpg jpg;

  AnimeImages({required this.jpg});

  factory AnimeImages.fromJson(Map<String, dynamic> json) =>
      _$AnimeImagesFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeImagesToJson(this);
}
