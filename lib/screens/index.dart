import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:shopping_app/components/categoryItem.dart';
import 'package:shopping_app/components/searchBar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shopping_app/components/shop_item.dart';
import 'package:shopping_app/models/shop_item.dart';
import 'package:shopping_app/screens/description.dart';
import '../models/categories.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> carouselImages = ["1.png", "2.png", "3.png"];
    List<Categories> categories = [
      Categories.fromJson({"image": "1.jpg", "title": "Shoes"}),
      Categories.fromJson({"image": "2.jpg", "title": "Bags"}),
      Categories.fromJson({"image": "3.jpg", "title": "Watches"}),
      Categories.fromJson({"image": "4.jpg", "title": "Stationary"}),
      Categories.fromJson({"image": "5.png", "title": "Jordans"}),
    ];

    List<ShopItemModel> shopItems = [
      ShopItemModel.fromJson({
        "image": "1.jpg",
        "title": "Watch",
        "price": "120.00",
        "rating": 4.2,
        "description": "This is a silver rolex watch that is so original",
        "reviews": "Lots of people have bought the item",
        "seller": "Henry",
        "specification": "Silver watch"
      }),
      ShopItemModel.fromJson({
        "image": "2.jpg",
        "title": "Acer Laptop",
        "price": "549.00",
        "rating": 4.8,
        "description": "Amazing Black acer laptop that can handle multiple tasks a day",
        "reviews": "Lots of people have bought the item",
        "seller": "Richard",
        "specification": "32GB RAM, 4 hours battery, comes with a 250watt charger"
      }),
      ShopItemModel.fromJson({
        "image": "3.jpg",
        "title": "Picfare Counter Book",
        "price": "5.40",
        "rating": 4.3,
        "description": "This is a black counter book that holds all kinds of information in one go",
        "reviews": "I highly recommend this product",
        "seller": "Sarah",
        "specification": "Black book"
      }),
      ShopItemModel.fromJson({
        "image": "4.png",
        "title": "Black Boots",
        "price": "234.00",
        "rating": 4.2,
        "description": "Boots that will help you walk in the mud on a heavy rainy day",
        "reviews": "Lots of people have bought the item",
        "seller": "Henry",
        "specification": "Black boots"
      }),
    ];

    return Column(
      children: [
        SizedBox(
          height: 70,
          child: ShopSearchBar(),
        ),
        CarouselSlider(
          items: <Widget>[
            for (int i = 0; i < carouselImages.length; i++)
              Container(
                padding: const EdgeInsets.all(10.0),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/carousel/${carouselImages[i]}",
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 150,
                          child: Text(
                            "SuperSale Discount",
                            softWrap: true,
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20, overflow: TextOverflow.visible),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                            child: const Text(
                              "Shop Now",
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
          ],
          options: CarouselOptions(
              autoPlayCurve: Curves.easeInOut,
              scrollDirection: Axis.vertical,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 4),
              pageSnapping: true,
              viewportFraction: 1),
        ),
        //Product Categories Slider
        CarouselSlider(
          items: <Widget>[
            for (int i = 0; i < categories.length; i++)
              GestureDetector(
                onTap: () {},
                child: Categoryitem(
                  image: categories[i].image,
                  title: categories[i].title,
                ),
              ),
          ],
          options: CarouselOptions(
            height: 130,
            viewportFraction: 0.2,
            autoPlay: true,
            autoPlayCurve: Curves.easeInOut,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(seconds: 1),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Special for you",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "see all",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade400,
                  decoration: TextDecoration.underline,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 225,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: shopItems.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDescription(
                      image: shopItems[i].image,
                      price: shopItems[i].price,
                      title: shopItems[i].title,
                      description: shopItems[i].description,
                      reviews: shopItems[i].reviews,
                      rating: shopItems[i].rating,
                      specification: shopItems[i].specification,
                      seller: shopItems[i].seller,
                    ),
                  ),
                );
              },
              child: ShopItem(
                image: shopItems[i].image,
                title: shopItems[i].title,
                price: shopItems[i].price,
              ),
            );
          },
        ),
      ],
    );
  }
}
