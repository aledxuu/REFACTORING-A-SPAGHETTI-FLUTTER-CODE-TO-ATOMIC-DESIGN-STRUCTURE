// ATOM: pure presentation, no logic, no state — just props in, UI out.
import 'package:flutter/material.dart';

enum AppTextStyle { title, body, caption }

class AppText extends StatelessWidget {
  final String text;
  final AppTextStyle style;

  const AppText(this.text, {super.key, this.style = AppTextStyle.body});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final textStyle = switch (style) {
      AppTextStyle.title => theme.titleMedium,
      AppTextStyle.body => theme.bodyMedium,
      AppTextStyle.caption => theme.bodySmall,
    };
    return Text(text, style: textStyle);
  }
}
