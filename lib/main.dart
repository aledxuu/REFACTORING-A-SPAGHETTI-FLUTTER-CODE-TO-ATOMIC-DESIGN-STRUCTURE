import 'package:flutter/material.dart';
import 'ui/pages/home_page.dart';

void main() {
  runApp(const AtomicDesignDemoApp());
}

class AtomicDesignDemoApp extends StatelessWidget {
  const AtomicDesignDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atomic Design Demo',
      theme: ThemeData(colorSchemeSeed: Colors.deepPurple, useMaterial3: true),
      home: const HomePage(),
    );
  }
}
