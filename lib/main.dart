import 'package:flutter/material.dart';
import 'package:shopping_cart_flutter/views/cart.dart';
import 'package:shopping_cart_flutter/views/details.dart';
import 'package:shopping_cart_flutter/views/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Index(),
        '/cart': (context) => Cart(),
        '/details': (context) => Details(),
      },
    );
  }
}
