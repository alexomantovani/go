import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go/widgets/common/shimmer_loading.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ShimmerLoading Widget Tests', () {
    testWidgets('Renders correctly with default values',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShimmerLoading(),
          ),
        ),
      );

      expect(find.byType(ShimmerLoading), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('Renders correctly as a circular shimmer',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShimmerLoading(circle: true, diameter: 80),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.shape, BoxShape.circle);
    });

    testWidgets('Renders correctly as a rectangular shimmer',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShimmerLoading(width: 120, height: 60),
          ),
        ),
      );

      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.shape, BoxShape.rectangle);
      expect(decoration.borderRadius, BorderRadius.circular(8.0));
    });

    testWidgets('ShimmerLoading has expected child container',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ShimmerLoading(),
          ),
        ),
      );

      final shimmer = tester.widget<Shimmer>(find.byType(Shimmer));
      expect(shimmer.child, isA<Container>());
    });
  });
}
