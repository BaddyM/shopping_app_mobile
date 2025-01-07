class ShopItemModel {
  String? image;
  String? title;
  String? price;
  double? rating;
  String? description;
  String? reviews;
  String? seller;
  String? specification;

  ShopItemModel({
    this.image,
    this.title,
    this.price,
    this.rating,
    this.description,
    this.reviews,
    this.seller,
    this.specification,
  });

  ShopItemModel.fromJson(Map<String, dynamic> json) {
    image = json["image"];
    title = json["title"];
    price = json["price"];
    rating = json["rating"];
    description = json["description"];
    reviews = json["reviews"];
    seller = json["seller"];
    specification = json["specification"];
  }
}
