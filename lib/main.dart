import 'package:flutter/material.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:food_app/pages/cart_page.dart';
import 'package:food_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => Restaurant(),
      )
    ],
    child: const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CartPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
