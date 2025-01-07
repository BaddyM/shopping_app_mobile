import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/material.dart";
import "package:hugeicons/hugeicons.dart";

class ProductDescription extends StatefulWidget {
  const ProductDescription({
    super.key,
    required this.image,
    required this.price,
    required this.title,
    this.rating,
    this.description,
    this.reviews,
    this.seller,
    this.specification,
  });

  final image;
  final price;
  final title;
  final rating;
  final seller;
  final description;
  final specification;
  final reviews;

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool descSelected = true;
  bool specSelected = false;
  bool reviewSelected = false;
  late List<String> descSpecReview;
  int selectedDescSpecReview = 0;
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    descSpecReview = [widget.description, widget.specification, widget.reviews];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
          ),
          icon: const HugeIcon(
            icon: HugeIcons.strokeRoundedArrowLeft01,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            icon: const HugeIcon(
              icon: HugeIcons.strokeRoundedShare08,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            icon: const HugeIcon(
              icon: HugeIcons.strokeRoundedFavourite,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              CarouselSlider(
                items: <Widget>[
                  Image.asset("assets/images/products/${widget.image}"),
                ],
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayCurve: Curves.easeInOut,
                  autoPlayInterval: const Duration(seconds: 4),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(15.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("${widget.title}"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("\$${widget.price}"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 1,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 251, 122, 16),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        size: 12,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "${widget.rating}",
                                        style: const TextStyle(
                                          fontSize: 11,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "(320 Review)",
                                  style: TextStyle(
                                    color: Colors.grey.shade300,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 11,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Text(
                          "Seller: ${widget.seller}",
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Color",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 120,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  border: Border.fromBorderSide(
                                    BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                              color: Colors.yellow,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              specSelected = false;
                              descSelected = true;
                              reviewSelected = false;
                              selectedDescSpecReview = 0;
                            });
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: descSelected ? Colors.orange : Colors.white,
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(100, 30),
                          ),
                          child: Text(
                            "Description",
                            style: TextStyle(
                              color: descSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              specSelected = true;
                              descSelected = false;
                              reviewSelected = false;
                              selectedDescSpecReview = 1;
                            });
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: specSelected ? Colors.orange : Colors.white,
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(100, 30),
                          ),
                          child: Text(
                            "Specifications",
                            style: TextStyle(
                              color: specSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              specSelected = false;
                              descSelected = false;
                              reviewSelected = true;
                              selectedDescSpecReview = 2;
                            });
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: reviewSelected ? Colors.orange : Colors.white,
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(100, 30),
                          ),
                          child: Text(
                            "Reviews",
                            style: TextStyle(
                              color: reviewSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                    ),
                    Text(
                      descSpecReview[selectedDescSpecReview].toString(),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 70,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (quantity > 1) {
                                          quantity--;
                                        }
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    style: IconButton.styleFrom(
                                      side: BorderSide.none,
                                      minimumSize: const Size(10, 10),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    child: Text(
                                      quantity.toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        quantity++;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    style: IconButton.styleFrom(
                                      side: BorderSide.none,
                                      minimumSize: const Size(10, 10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 4,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 251, 113, 0),
                              ),
                              child: const Text(
                                "Add to Cart",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
