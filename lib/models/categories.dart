class Categories {
  String? image;
  String? title;

  Categories({required this.image, required this.title});

//From json
  Categories.fromJson(Map<String, dynamic> json) {
    image = json["image"];
    title = json["title"];
  }
}
