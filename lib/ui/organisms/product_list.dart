import 'package:flutter/material.dart';
import 'product_card.dart';

class ProductList extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  final Function(Map<String, dynamic>) onDelete;

  const ProductList({
    super.key,
    required this.products,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: products
          .map((p) => ProductCard(
                product: p,
                onDelete: () => onDelete(p),
              ))
          .toList(),
    );
  }
}