import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ShopSearchBar extends StatefulWidget {
  ShopSearchBar({super.key});

  @override
  State<ShopSearchBar> createState() => _ShopSearchBarState();
}

class _ShopSearchBarState extends State<ShopSearchBar> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: () {
              {
                searchController.clear();
              }
            },
            icon: HugeIcon(icon: HugeIcons.strokeRoundedCancel01, color: Colors.grey.shade600)),
        hintText: "Search",
        hintStyle: TextStyle(color: Colors.grey.shade600),
        prefixIcon: HugeIcon(icon: HugeIcons.strokeRoundedSearch01, color: Colors.grey.shade600),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(color: Colors.grey.shade100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(
            color: Colors.grey.shade600,
            width: 2,
          ),
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
      ),
    );
  }
}
