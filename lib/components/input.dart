import "package:flutter/material.dart";

class ShopInput extends StatelessWidget {
  const ShopInput({
    super.key,
    required this.controller,
    required this.title,
  });
  final controller;
  final title;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title.toString(),
        labelStyle: TextStyle(
          color: Colors.grey.shade700,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade500,
            width: 2,
          ),
        ),
      ),
    );
  }
}
