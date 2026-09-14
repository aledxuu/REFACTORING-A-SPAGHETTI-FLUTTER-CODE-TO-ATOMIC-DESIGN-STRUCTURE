// ORGANISM: a recognizable component — logo + SearchBar molecule + profile
// icon — composed together, still with no data fetching of its own.
import 'package:flutter/material.dart' hide SearchBar;
import '../atoms/app_icon.dart';
import '../molecules/search_bar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          const AppIcon(Icons.storefront, size: 28),
          const SizedBox(width: 12),
          const Expanded(child: SearchBar()),
          const SizedBox(width: 12),
          const AppIcon(Icons.account_circle),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
