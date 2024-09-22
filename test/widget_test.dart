// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_and_mock_session/main.dart';

void main() {
  testWidgets('SnackBar Test in GetData Ui', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: HomePage(),
    ));
    final button = find.byType(FloatingActionButton);
    await tester.tap(button);

    await tester.pump();

    final textWidget = find.byType(SnackBar);

    expect(textWidget, findsOneWidget);
  });
}
