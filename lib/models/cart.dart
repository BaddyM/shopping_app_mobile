class Cart {
  String? image;
  String? title;
  String? shop;
  double? price;
  int? qty;
  int? index;

  Cart({required this.image, required this.title, this.shop, required this.price, this.qty, this.index});

  Cart.fromJson(Map<String, dynamic> json) {
    image = json["image"];
    title = json["title"];
    shop = json["shop"];
    price = json["price"];
    qty = json["qty"];
    index = json["index"];
  }
}
