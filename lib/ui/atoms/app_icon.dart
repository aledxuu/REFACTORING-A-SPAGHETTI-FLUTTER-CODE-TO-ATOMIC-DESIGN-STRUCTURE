// ATOM: pure presentation, no logic, no state — just props in, UI out.
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final double size;

  const AppIcon(this.icon, {super.key, this.size = 24});

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: size, color: Theme.of(context).colorScheme.primary);
  }
}
