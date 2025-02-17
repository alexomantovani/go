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

    expect(find.byType(Container), findsNWidgets(6));
    expect(find.byType(Column), findsOneWidget);
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

    final container =
        tester.widget<Container>(find.byKey(const Key('Container')));

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

    final container =
        tester.widget<Container>(find.byKey(const Key('Container')));

    final BoxDecoration? decoration = container.decoration as BoxDecoration?;
    expect(decoration?.borderRadius, isNotNull);

    final borderRadius = decoration?.borderRadius as BorderRadius;
    expect(borderRadius.topLeft, const Radius.circular(24));
    expect(borderRadius.topRight, const Radius.circular(24));
  });

  testWidgets('[LoadingWidget] contains expected ShimmerLoading widgets',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LoadingWidget(),
        ),
      ),
    );

    expect(find.byKey(const Key('ShimmerLoading_Circle')), findsOneWidget);
    expect(find.byKey(const Key('ShimmerLoading_Rectangle')), findsOneWidget);

    for (int i = 0; i < 2; i++) {
      expect(find.byKey(Key('ShimmerLoading_$i')), findsOneWidget);
    }
  });
}
