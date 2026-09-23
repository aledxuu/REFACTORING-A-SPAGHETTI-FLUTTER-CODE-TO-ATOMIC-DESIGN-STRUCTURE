import 'package:flutter/material.dart';
import '../atoms/product_icon.dart';
import '../atoms/delete_button.dart';
import '../molecules/product_info.dart';
import '../molecules/add_to_cart_button.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onDelete;

  const ProductCard({
    super.key,
    required this.product,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          ProductIcon(icon: product["icon"]),
          const SizedBox(width: 12),
          Expanded(
            child: ProductInfo(
              name: product["name"],
              category: product["category"],
              price: product["price"],
            ),
          ),
          Column(
            children: [
              AddToCartButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            "Added ${product["name"]} to cart")),
                  );
                },
              ),
              const SizedBox(height: 6),
              DeleteButton(onPressed: onDelete),
            ],
          )
        ],
      ),
    );
  }
}