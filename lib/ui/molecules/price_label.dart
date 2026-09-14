// MOLECULE: a styled Text with one job — formatting and displaying a price.
import 'package:flutter/material.dart';
import '../atoms/app_text.dart';

class PriceLabel extends StatelessWidget {
  final double price;

  const PriceLabel(this.price, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppText('\$${price.toStringAsFixed(2)}', style: AppTextStyle.title);
  }
}
