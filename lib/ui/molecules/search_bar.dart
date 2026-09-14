// MOLECULE: combines 2 atoms (AppIcon + TextField) for one job — searching.
// StatefulWidget only for local UI state (clear-button visibility);
// no API/data calls happen here.
// `hide SearchBar` avoids clashing with Material 3's built-in SearchBar
// widget — this file defines our own for the demo.
import 'package:flutter/material.dart' hide SearchBar;
import '../atoms/app_icon.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _controller = TextEditingController();
  bool _hasText = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: (value) => setState(() => _hasText = value.isNotEmpty),
      decoration: InputDecoration(
        hintText: 'Search products...',
        prefixIcon: const AppIcon(Icons.search, size: 20),
        suffixIcon: _hasText
            ? IconButton(
                icon: const AppIcon(Icons.clear, size: 18),
                onPressed: () {
                  _controller.clear();
                  setState(() => _hasText = false);
                },
              )
            : null,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
      ),
    );
  }
}
