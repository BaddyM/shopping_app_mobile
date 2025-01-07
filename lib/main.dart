import 'package:flutter/material.dart';
import 'package:shopping_app/screens/description.dart';
import 'package:shopping_app/screens/home.dart';
import 'package:shopping_app/screens/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColorDark: Colors.blue.withOpacity(1),
        appBarTheme: const AppBarTheme(color: Colors.white),
        primaryColor: Colors.blue,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        useMaterial3: true,
      ),
      home: const ShopHome(),
    );
  }
}