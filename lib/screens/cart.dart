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
                    cartItem.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: CartItem(
                              image: cartItem[i].image.toString(),
                              title: cartItem[i].title.toString(),
                              price: cartItem[i].price!.toDouble(),
                              shop: cartItem[i].shop.toString(),
                              qty: cartItem[i].qty!.toInt(),
                              index: i,
                            ),
                          )
                        : const Text(
                            "Sorry, your cart seems empty",
                            style: TextStyle(
                              color: Colors.red,
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
                            Text("\$${provider.cartTotal.toStringAsFixed(2)}"),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.maxFinite,
                          child: TextButton(
                            onPressed: () {
                              provider.checkout();
                              provider.cartSubTotal();
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Theme.of(context).primaryColor,
                                  content: const Text(
                                    "Order Completed successfully",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColorLight,
                              elevation: 5,
                              shadowColor: Colors.grey.shade300,
                            ),
                            child: const Text(
                              "Checkout",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
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
          ),
        );
      },
    );
  }
}
