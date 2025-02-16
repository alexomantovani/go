import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go/core/services/styles.dart';

import 'package:go/widgets/motel/error_message_widget.dart';

void main() {
  testWidgets('[ErrorMessageWidget] renders correctly with an error message',
      (WidgetTester tester) async {
    const errorMessage = 'Erro de rede';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ErrorMessageWidget(error: errorMessage),
        ),
      ),
    );

    expect(find.byType(ErrorMessageWidget), findsOneWidget);

    expect(find.text(errorMessage), findsOneWidget);

    final textFinder = find.text(errorMessage);
    final textWidget = tester.widget<Text>(textFinder);
    final textStyle = textWidget.style;

    expect(textStyle?.color, equals(Styles.kPrimaryText));

    final containerFinder = find.byType(Container);
    final containerWidget = tester.widget<Container>(containerFinder);
    final decoration = containerWidget.decoration as BoxDecoration;

    expect(decoration.color, equals(Styles.kPrimaryPale));
  });

  testWidgets('[ErrorMessageWidget] handles empty error message correctly',
      (WidgetTester tester) async {
    const errorMessage = '';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ErrorMessageWidget(error: errorMessage),
        ),
      ),
    );

    expect(find.byType(ErrorMessageWidget), findsOneWidget);

    expect(find.text(errorMessage), findsOneWidget);

    final containerFinder = find.byType(Container);
    final containerWidget = tester.widget<Container>(containerFinder);
    final decoration = containerWidget.decoration as BoxDecoration;

    expect(decoration.color, equals(Styles.kPrimaryPale));
  });
}
