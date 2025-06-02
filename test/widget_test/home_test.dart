import 'dart:io';

import 'package:bai1/app/home_controller.dart';
import 'package:bai1/app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../base_test/base_expect_spacing_widget.dart';

void main() {
  /// Check is exist app bar
  testWidgets('AppBar exists', (tester) async {
    await pumpScreen(tester, HomeScreen());
    expect(find.byType(AppBar), findsOneWidget);
  });

  ///CheckImage
  testWidgets('Image or Loading', (widgetTester) async {
    final controller = HomeController();
    await pumpScreen(
        widgetTester,
        HomeScreen(
          controller: controller,
        ));

    controller.changeIsLoading(true);

    await widgetTester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(Icon), findsNothing);
    expect(find.byType(Image), findsNothing);

    controller.changeIsLoading(false);
    controller.changeImageFile(null);
    await widgetTester.pump();
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(Icon), findsOneWidget);
    expect(find.byType(Image), findsNothing);

    controller.changeIsLoading(false);
    controller.changeImageFile(File('path'));
    await widgetTester.pump();
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(Icon), findsNothing);
    expect(find.byType(Image), findsOneWidget);
  });

  /// Check is exists text field prompt
  testWidgets('TextField with key "input prompt" exists', (tester) async {
    await pumpScreen(tester, HomeScreen());
    expect(find.byKey(Key('input prompt')), findsOneWidget);
  });

  /// Check is exist send button
  testWidgets('Send button exists', (tester) async {
    await pumpScreen(tester, HomeScreen());
    expect(find.text('Send'), findsOneWidget);
  });

  /// Test contains of prompt after click send button
  testWidgets('Prompt is not null after clicking Send', (tester) async {
    final controller = HomeController();
    await pumpScreen(
        tester,
        HomeScreen(
          controller: controller,
        ));
    final sendButtonFinder = find.text('Send');
    await tester.tap(sendButtonFinder);
    await tester.pump();
    expect(controller.prompt, isNotNull);
  });
}
