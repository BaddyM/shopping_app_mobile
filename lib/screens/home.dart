import "package:flutter/material.dart";
import "package:hugeicons/hugeicons.dart";
import "package:provider/provider.dart";
import "package:shopping_app/providers/cart_provider.dart";
import "package:shopping_app/screens/cart.dart";
import "package:shopping_app/screens/description.dart";
import "package:shopping_app/screens/index.dart";

class ShopHome extends StatelessWidget {
  const ShopHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "My Shop",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ShopCart(),
                        ),
                      );
                    },
                    icon: const HugeIcon(
                      icon: HugeIcons.strokeRoundedShoppingBag02,
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    left: 25,
                    top: 10,
                    child: Badge(
                      backgroundColor: Colors.red,
                      label: Text(
                        provider.cartCounter.toString(),
                      ),
                    ),
                  )
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const HugeIcon(
                  icon: HugeIcons.strokeRoundedUser,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.grey.shade200,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20), color: Colors.white, child: const HomePage()),
            ),
          ),
        );
      },
    );
  }
}
