// PAGE: the only file holding the mock product "data" — wires it into the
// template and organisms below. No network, no Firebase; just a demo.
import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../organisms/custom_app_bar.dart';
import '../organisms/product_card.dart';
import '../templates/product_list_template.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final List<Product> _mockProducts = [
    const Product(id: '1', name: 'Coffee Mug', price: 9.99, icon: Icons.coffee),
    const Product(id: '2', name: 'T-Shirt', price: 19.99, icon: Icons.checkroom),
    const Product(id: '3', name: 'Sneakers', price: 59.99, icon: Icons.sports_baseball_outlined),
    const Product(id: '4', name: 'Backpack', price: 34.99, icon: Icons.backpack),
    const Product(id: '5', name: 'Sunglasses', price: 14.99, icon: Icons.wb_sunny_outlined),
    const Product(id: '6', name: 'Notebook', price: 4.99, icon: Icons.book),
  ];

  @override
  Widget build(BuildContext context) {
    return ProductListTemplate(
      appBar: const CustomAppBar(),
      children: _mockProducts
          .map((product) => ProductCard(
                product: product,
                onAddToCart: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Added ${product.name} to cart')),
                  );
                },
              ))
          .toList(),
    );
  }
}
