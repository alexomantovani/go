import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go/core/services/styles.dart';
import 'package:go/widgets/common/loading_widget.dart';

void main() {
  testWidgets('[LoadingWidget] renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LoadingWidget(),
        ),
      ),
    );

    expect(find.byType(Container), findsOneWidget);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('[LoadingWidget] has correct background color',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LoadingWidget(),
        ),
      ),
    );

    final container = tester.widget<Container>(find.byType(Container));

    final BoxDecoration? decoration = container.decoration as BoxDecoration?;
    expect(decoration, isNotNull);
    expect(decoration?.color, equals(Styles.kPrimaryPale));
  });

  testWidgets('[LoadingWidget] has rounded top corners',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LoadingWidget(),
        ),
      ),
    );

    final container = tester.widget<Container>(find.byType(Container));

    final BoxDecoration? decoration = container.decoration as BoxDecoration?;
    expect(decoration?.borderRadius, isNotNull);

    final borderRadius = decoration?.borderRadius as BorderRadius;
    expect(borderRadius.topLeft, const Radius.circular(24));
    expect(borderRadius.topRight, const Radius.circular(24));
  });
}
