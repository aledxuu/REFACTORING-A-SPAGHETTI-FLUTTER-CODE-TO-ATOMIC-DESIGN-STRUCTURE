import 'package:flutter/material.dart';
import '../atoms/product_text_field.dart';
import '../atoms/category_dropdown.dart';
import '../atoms/primary_button.dart';

class ProductForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController priceController;
  final TextEditingController descriptionController;
  final String selectedCategory;
  final ValueChanged<String?> onCategoryChanged;
  final VoidCallback onSubmit;

  const ProductForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.priceController,
    required this.descriptionController,
    required this.selectedCategory,
    required this.onCategoryChanged,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          ProductTextField(
            controller: nameController,
            label: "Product Name",
            validator: (value) =>
                value == null || value.trim().isEmpty
                    ? "Product name is required"
                    : null,
          ),
          const SizedBox(height: 12),
          ProductTextField(
            controller: priceController,
            label: "Price",
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Price is required";
              }
              final parsed = double.tryParse(value);
              if (parsed == null) return "Price must be a number";
              if (parsed <= 0) {
                return "Price must be greater than zero";
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          CategoryDropdown(
            value: selectedCategory,
            onChanged: onCategoryChanged,
          ),
          const SizedBox(height: 12),
          ProductTextField(
            controller: descriptionController,
            label: "Description",
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            text: "Submit Product",
            onPressed: onSubmit,
          ),
        ],
      ),
    );
  }
}