// MODEL: plain data class, no UI, no atomic-design level of its own.
import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final double price;
  // No network images in this demo — an Icon stands in for artwork so it
  // keeps working offline in class.
  final IconData icon;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    this.icon = Icons.shopping_bag,
  });
}
