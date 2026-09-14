import 'package:flutter_test/flutter_test.dart';

import 'package:atomic_design_demo/main.dart';

void main() {
  testWidgets('App builds and shows a product', (WidgetTester tester) async {
    await tester.pumpWidget(const AtomicDesignDemoApp());
    expect(find.text('Coffee Mug'), findsOneWidget);
  });
}
