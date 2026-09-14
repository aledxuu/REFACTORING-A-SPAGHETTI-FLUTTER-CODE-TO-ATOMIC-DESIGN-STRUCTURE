// TEMPLATE: layout skeleton only. Takes an AppBar and a list of children as
// params and arranges them — it never knows what a "real" product is, and
// renders correctly even with an empty list (see DEMO_SCRIPT.md).
import 'package:flutter/material.dart';

class ProductListTemplate extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final List<Widget> children;

  const ProductListTemplate({
    super.key,
    required this.appBar,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: children.isEmpty
          ? const Center(child: Text('No products to show'))
          : GridView.count(
              padding: const EdgeInsets.all(12),
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.8,
              children: children,
            ),
    );
  }
}
