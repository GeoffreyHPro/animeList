class Anime {
  final int? id;
  final String? title;
  final int? year;
  final double? score;
  final String? image;
  final String? synopsis;
  String annotation = "";

  Anime(
      {required this.id,
      required this.title,
      required this.year,
      required this.score,
      required this.image,
      required this.annotation,
      required this.synopsis});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'year': year,
      'score': score,
      'image': image,
      'annotation': annotation,
      'synopsis': synopsis
    };
  }

  @override
  String toString() {
    return 'Anime{id: $id,title: $title,year: $year, score: $score, image: $image, annotation: $annotation, synopsis: $synopsis}';
  }
}
