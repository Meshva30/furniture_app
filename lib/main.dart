import 'package:flutter/material.dart';
import 'package:furniture_app/Product_screen.dart';
import 'package:furniture_app/cart_screen.dart';

import 'package:furniture_app/home_screen.dart';
import 'package:furniture_app/model/category_model.dart';
import 'package:furniture_app/splash_screen.dart';
import 'package:furniture_app/widgets/list_items.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Splash_screen(),
        'home': (context) => Home_screen(),
        'cart': (context) => Cartscreen(),
      },
    ),
  );
}
