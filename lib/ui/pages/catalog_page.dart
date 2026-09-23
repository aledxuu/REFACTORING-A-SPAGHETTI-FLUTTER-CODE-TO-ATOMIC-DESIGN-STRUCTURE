import 'package:flutter/material.dart';

import '../templates/catalog_template.dart';
import '../organisms/catalog_app_bar.dart';
import '../organisms/product_list.dart';
import '../organisms/product_form.dart';
import '../atoms/search_field.dart';
import '../atoms/section_title.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final List<Map<String, dynamic>> _products = [
    {
      'id': 1,
      'name': 'Wireless Mouse',
      'price': 599.0,
      'category': 'Electronics',
      'icon': Icons.mouse,
    },
    {
      'id': 2,
      'name': 'Mechanical Keyboard',
      'price': 2499.0,
      'category': 'Electronics',
      'icon': Icons.keyboard,
    },
    {
      'id': 3,
      'name': 'Ceramic Mug',
      'price': 149.0,
      'category': 'Home',
      'icon': Icons.coffee,
    },
    {
      'id': 4,
      'name': 'Notebook',
      'price': 79.0,
      'category': 'Office',
      'icon': Icons.book,
    },
    {
      'id': 5,
      'name': 'Desk Lamp',
      'price': 899.0,
      'category': 'Home',
      'icon': Icons.lightbulb,
    },
    {
      'id': 6,
      'name': 'Backpack',
      'price': 1299.0,
      'category': 'Accessories',
      'icon': Icons.backpack,
    },
    {
      'id': 7,
      'name': 'Water Bottle',
      'price': 299.0,
      'category': 'Accessories',
      'icon': Icons.local_drink,
    },
  ];

  String _searchQuery = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String _selectedCategory = 'Electronics';

  int _nextId = 8;

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitNewProduct() {
    if (_formKey.currentState!.validate()) {
      final newProduct = {
        'id': _nextId,
        'name': _nameController.text,
        'price': double.parse(_priceController.text),
        'category': _selectedCategory,
        'icon': Icons.inventory_2,
        'description': _descriptionController.text,
      };

      setState(() {
        _products.add(newProduct);
        _nextId++;
        _searchQuery = '';
        _nameController.clear();
        _priceController.clear();
        _descriptionController.clear();
        _selectedCategory = 'Electronics';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${newProduct['name']} added to catalog!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = _products.where((product) {
      return product['name']
          .toString()
          .toLowerCase()
          .contains(_searchQuery.toLowerCase());
    }).toList();

    return CatalogTemplate(
      appBar: const CatalogAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(text: 'Search Products'),
          const SizedBox(height: 8),

          SearchField(
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
          ),

          const SizedBox(height: 16),

          const SectionTitle(text: 'Catalog'),
          const SizedBox(height: 8),

          ProductList(
            products: filteredProducts,
            onDelete: (product) {
              setState(() {
                _products.removeWhere((p) => p['id'] == product['id']);
              });
            },
          ),

          const Divider(height: 32, thickness: 1),

          const SectionTitle(text: 'Add New Product'),
          const SizedBox(height: 12),

          ProductForm(
            formKey: _formKey,
            nameController: _nameController,
            priceController: _priceController,
            descriptionController: _descriptionController,
            selectedCategory: _selectedCategory,
            onCategoryChanged: (value) {
              setState(() {
                _selectedCategory = value ?? 'Electronics';
              });
            },
            onSubmit: _submitNewProduct,
          ),
        ],
      ),
    );
  }
}