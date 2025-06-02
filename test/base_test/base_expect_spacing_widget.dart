import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> pumpScreen(WidgetTester tester, Widget widget) async {
  await tester.pumpWidget(MaterialApp(home: widget));
}

/// Check space between 2 widget.
Future<void> expectSpacingBetween(
    WidgetTester tester, Finder first, Finder second, double expectedSpacing) async {
  final firstBox = tester.renderObject<RenderBox>(first);
  final secondBox = tester.renderObject<RenderBox>(second);

  final firstRight = firstBox.localToGlobal(Offset(firstBox.size.width, 0));
  final secondLeft = secondBox.localToGlobal(Offset.zero);

  final spacing = secondLeft.dx - firstRight.dx;
  expect(spacing, expectedSpacing, reason: 'Expected spacing of $expectedSpacing but got $spacing');
}


