import 'package:bai1/app/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'OverlaySearchIdeal updates suggestions and shows overlay correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: OverlaySearchIdeal(),
        ),
      ),
    );

    // Tìm TextField
    final textFieldFinder = find.byType(TextField);
    expect(textFieldFinder, findsOneWidget);

    await tester.enterText(textFieldFinder, 'a');
    await tester.pumpAndSettle();

    await tester.enterText(textFieldFinder, '.');
    await tester.pumpAndSettle();

    expect(find.text('Apple'), findsOneWidget);
    expect(find.text('Banana'), findsOneWidget);

    await tester.enterText(textFieldFinder, '');
    await tester.pumpAndSettle();

    expect(find.text('Apple'), findsNothing);
    expect(find.text('Banana'), findsNothing);
  });
}
