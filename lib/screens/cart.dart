import "package:flutter/material.dart";
import "package:hugeicons/hugeicons.dart";
import "package:provider/provider.dart";
import "package:shopping_app/components/cart_item.dart";
import "package:shopping_app/models/cart.dart";
import "package:shopping_app/providers/cart_provider.dart";

class ShopCart extends StatefulWidget {
  const ShopCart({super.key});

  @override
  State<ShopCart> createState() => _ShopCartState();
}

class _ShopCartState extends State<ShopCart> {
  // List<Cart> cartItem = [
  //   Cart.fromJson({
  //     "image": "1.jpg",
  //     "title": "Rolex Watch",
  //     "price": 56.00,
  //     "shop": "Mukwano Arcade",
  //     "qty": 1,
  //   }),
  //   Cart.fromJson({
  //     "image": "2.jpg",
  //     "title": "Acer Laptop",
  //     "price": 1500.00,
  //     "shop": "Mutaasa Kafeero",
  //     "qty": 1,
  //   }),
  // ];

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, provider, _) {
        List<Cart> cartItem = provider.cartItems;
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              icon: const HugeIcon(icon: HugeIcons.strokeRoundedArrowLeft01, color: Colors.black),
            ),
            title: const Text(
              "Cart",
            ),
            titleTextStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  for (int i = 0; i < cartItem.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: CartItem(
                        image: cartItem[i].image.toString(),
                        title: cartItem[i].title.toString(),
                        price: cartItem[i].price!.toDouble(),
                        shop: cartItem[i].shop.toString(),
                        qty: cartItem[i].qty!.toInt(),
                      ),
                    ),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Coupon",
                              hintStyle: TextStyle(
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.normal,
                              ),
                              suffixIcon: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Apply",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade200,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.shade200,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Subtotal",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Builder(builder: (context) {
                              var subTotal = 0.0;
                              for (int i = 0; i < cartItem.length; i++) {
                                subTotal = subTotal + cartItem[i].price!.toDouble();
                              }
                              return Text("");
                            }),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
