import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

@JsonSerializable()
class Pagination {

  @JsonKey(name: "last_visible_page")
  final int lastPage;

  @JsonKey(name: "has_next_page")
  final bool nextPage;

  @JsonKey(name: "current_page")
  final int currentPage;

  Pagination({required this.lastPage,required this.nextPage, required this.currentPage});

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
