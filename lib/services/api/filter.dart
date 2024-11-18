import 'package:projet_tm/widget/filter/checkbox.dart';

List<Checked> checkboxes = [
    Checked(name: "all", checked: true),
    Checked(checked: false, name: "tv"),
    Checked(name:"movie", checked: false),
    Checked(name:"ova", checked: false),
    Checked(name:"special", checked: false),
    Checked(name:"ona", checked: false),
    Checked(name:"music", checked: false)
  ];


class Filter {
  String name;
  double scoreMin;
  double scoreMax;
  String type;
  List<Checked> types;
  String order;

  Filter(
      {this.name = "",
      this.scoreMin = 0,
      this.scoreMax = 10,
      this.order = "none",
      this.type = "all",
      this.types = const [] /*[
    Checked(name: "all", checked: true),
    Checked(checked: false, name: "tv"),
    Checked(name:"movie", checked: false),
    Checked(name:"ova", checked: false),
    Checked(name:"special", checked: false),
    Checked(name:"ona", checked: false),
    Checked(name:"music", checked: false)
  ]*/});
}

Filter filterSearch = Filter();

List<String> typeFilterList = [
  "all",
  "tv",
  "movie",
  "ova",
  "special",
  "ona",
  "music",
];

