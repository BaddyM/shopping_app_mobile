import "package:flutter/material.dart";
import "package:hugeicons/hugeicons.dart";
import "package:shopping_app/components/input.dart";

import "../models/profile.dart";

class Profile extends StatelessWidget {
  const Profile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController _lastNameController = TextEditingController();
    TextEditingController _firstNameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _locationController = TextEditingController();

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
          "Profile",
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShopInput(title: "Last Name", controller: _lastNameController),
                      ShopInput(title: "First Name", controller: _firstNameController),
                      ShopInput(title: "Email", controller: _emailController),
                      ShopInput(title: "Location", controller: _locationController),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                  ),
                  width: double.maxFinite,
                  child: TextButton(
                    onPressed: () {
                      ProfileModel profile = ProfileModel.fromJson({
                        "last_name": _lastNameController.text,
                        "first_name": _firstNameController.text,
                        "email": _emailController.text,
                        "location": _locationController.text,
                      });
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColorLight,
                      elevation: 3,
                      shadowColor: Colors.grey.shade500,
                    ),
                    child: const Text(
                      "Save",
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
        ),
      ),
    );
  }
}
