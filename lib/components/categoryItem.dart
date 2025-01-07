import "package:flutter/material.dart";
import "package:shopping_app/models/categories.dart";

class Categoryitem extends StatelessWidget {
  final image;
  final title;
  const Categoryitem({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 70,
      height: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(400),
            child: Image.asset(
              "assets/images/categories/${image}",
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            title.toString(),
            textAlign: TextAlign.center,
            softWrap: true,
            style: const TextStyle(fontSize: 12, height: 1.1, overflow: TextOverflow.visible),
          ),
        ],
      ),
    );
  }
}
