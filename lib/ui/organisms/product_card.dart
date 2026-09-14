// ORGANISM: a recognizable component composed of molecules + atoms.
// Takes a Product and a callback — never fetches data itself.
import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../atoms/app_button.dart';
import '../atoms/app_text.dart';
import '../molecules/price_label.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.product,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(product.icon, size: 48),
            const SizedBox(height: 8),
            AppText(product.name, style: AppTextStyle.body),
            PriceLabel(product.price),
            const SizedBox(height: 8),
            AppButton(label: 'Add to cart', onPressed: onAddToCart),
          ],
        ),
      ),
    );
  }
}
