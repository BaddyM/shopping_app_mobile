import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/models/cart.dart';
import 'package:shopping_app/providers/cart_provider.dart';

// ignore: must_be_immutable
class CartItem extends StatefulWidget {
  CartItem({
    super.key,
    required this.image,
    required this.title,
    this.shop,
    required this.price,
    required this.qty,
    required this.index,
  });

  final String image;
  final String title;
  final String? shop;
  final double price;
  int qty;
  int index;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  double total = 0.0;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, provider, _) {
      return Container(
        height: 115,
        margin: const EdgeInsets.only(
          bottom: 20,
        ),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(0, 2),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/images/products/${widget.image}",
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          widget.shop.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "\$${provider.cartItems[widget.index].price!.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        provider.removeItem(widget.index);
                        provider.cartSubTotal();
                      },
                      icon: const HugeIcon(
                        icon: HugeIcons.strokeRoundedDelete02,
                        color: Colors.red,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 2,
                      ),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              int? currentQty = provider.cartItems[widget.index].qty;
                              if (currentQty! > 1) {
                                currentQty--;
                                provider.checkQty(widget.index, currentQty);
                                provider.cartSubTotal();
                              }
                            },
                            child: const HugeIcon(
                              icon: HugeIcons.strokeRoundedRemove01,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                          SizedBox(
                            child: Text(
                              widget.qty.toString(),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              int currentQty = provider.cartItems[widget.index].qty!;
                              currentQty++;
                              provider.checkQty(widget.index, currentQty);
                              provider.cartSubTotal();
                            },
                            child: const HugeIcon(
                              icon: HugeIcons.strokeRoundedAdd01,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
