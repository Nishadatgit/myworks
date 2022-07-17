import 'package:flutter/material.dart';

class Product {
  final String imageUrl;
  final double price;
  final double carbo;
  final double water;
  final double sugar;
  final String name;
  final String flavour;
  final Color shadow;
  final String shortname;

  Product(
      {required this.imageUrl,
      required this.price,
      required this.carbo,
      required this.water,
      required this.sugar,
      required this.name,
      required this.shadow,
      required this.flavour,
      required this.shortname});
}

List<Product> popular = [
  Product(
      imageUrl: 'assets/png/cola.png',
      price: 50,
      carbo: 10.8,
      water: 9.5,
      sugar: 2.5,
      name: 'Cola Soda',
      shortname: 'Cola',
      flavour: 'Cola Flavour',
      shadow: Colors.red),
  Product(
      imageUrl: 'assets/png/pepsi2.png',
      price: 40,
      carbo: 9.8,
      water: 10.5,
      sugar: 3.5,
      name: 'Pepsi Soda',
      shortname: 'Pepsi',
      flavour: 'Caffine Flavour',
      shadow: const Color.fromARGB(255, 7, 91, 160)),
  Product(
      imageUrl: 'assets/png/dew.png',
      price: 45,
      carbo: 10.1,
      water: 8.5,
      sugar: 2.0,
      shortname: 'Dew',
      name: 'Mountain Dew',
      flavour: 'Dew Flavour',
      shadow: const Color.fromARGB(255, 13, 217, 20)),
  Product(
      imageUrl: 'assets/png/fanta.png',
      price: 50,
      carbo: 10.8,
      water: 9.5,
      sugar: 2.5,
      shortname: 'Fanta',
      name: 'Fanta Soda',
      flavour: 'Grape Flavour',
      shadow: Colors.purple)
];
