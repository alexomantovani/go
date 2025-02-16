import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:go/models/motel_model.dart';
import 'package:go/widgets/motel/slider_dots.dart';

import 'slider_dots_test.mocks.dart';

@GenerateMocks([CarouselSliderController])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('SliderDots Widget Tests with Mockito', () {
    late MockCarouselSliderController mockController;
    late List<MotelModel> motels;

    setUp(() {
      mockController = MockCarouselSliderController();
      motels = List.generate(3, (_) => MotelModel.empty());
    });

    testWidgets(
        '[SliderDots] renders nothing when motels is null (SizedBox.shrink())',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SliderDots(
              motels: null,
              controller: CarouselSliderController(),
              current: 0,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Wrap), findsNothing);
    });

    testWidgets('[SliderDots] renders correct number of dots',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SliderDots(
              motels: motels,
              controller: mockController,
              current: 1,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GestureDetector), findsNWidgets(motels.length));
    });

    testWidgets(
        '[SliderDots] tapping a dot calls animateToPage with correct index',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SliderDots(
              motels: motels,
              controller: mockController,
              current: 1,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final firstDotFinder = find.byType(GestureDetector).first;
      await tester.tap(firstDotFinder);
      await tester.pumpAndSettle();

      verify(mockController.animateToPage(0,
              duration: anyNamed('duration'), curve: anyNamed('curve')))
          .called(1);
    });

    testWidgets(
        '[SliderDots] dot colors reflect current index (opacity 0.75 for current, 0.4 otherwise)',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(brightness: Brightness.light),
          home: Scaffold(
            body: SliderDots(
              motels: motels,
              controller: mockController,
              current: 1,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final dotContainers = tester.widgetList<Container>(
        find.byWidgetPredicate((widget) {
          if (widget is Container && widget.decoration is BoxDecoration) {
            final dec = widget.decoration as BoxDecoration;
            return dec.shape == BoxShape.circle;
          }
          return false;
        }),
      ).toList();

      expect(dotContainers.length, equals(motels.length));

      for (int i = 0; i < dotContainers.length; i++) {
        final decoration = dotContainers[i].decoration as BoxDecoration;
        expect(decoration.color?.a, equals(i == 1 ? 0.75 : 0.4),
            reason: 'Dot $i has incorrect alpha value');
      }
    });
  });
}
