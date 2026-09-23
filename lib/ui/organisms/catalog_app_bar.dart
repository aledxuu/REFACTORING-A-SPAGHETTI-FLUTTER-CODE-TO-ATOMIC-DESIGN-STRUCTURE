import 'package:flutter/material.dart';

class CatalogAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CatalogAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.indigo,
      title: const Text(
        "Messy Catalog",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}