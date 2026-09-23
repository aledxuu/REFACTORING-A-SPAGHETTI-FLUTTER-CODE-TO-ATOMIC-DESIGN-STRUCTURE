import 'package:flutter/material.dart';

class CategoryDropdown extends StatelessWidget {
  final String value;
  final ValueChanged<String?> onChanged;

  const CategoryDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      decoration: const InputDecoration(labelText: "Category"),
      items: ["Electronics", "Home", "Office", "Accessories"]
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: onChanged,
    );
  }
}