class Filter {
  String name;
  double scoreMin;
  double scoreMax;
  String type;
  String order;

  Filter(
      {this.name = "",
      this.scoreMin = 0,
      this.scoreMax = 10,
      this.type = "all",
      this.order = "none"});
}

Filter filterSearch = Filter();
