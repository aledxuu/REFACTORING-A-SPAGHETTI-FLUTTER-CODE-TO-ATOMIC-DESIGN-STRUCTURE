import 'package:flutter/material.dart';

class CatalogTemplate extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final Widget body;

  const CatalogTemplate({
    super.key,
    required this.appBar,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: body,
      ),
    );
  }
}