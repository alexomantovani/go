import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:go/models/motel_model.dart';
import 'package:go/widgets/motel/motel_carousel.dart';
import 'package:go/widgets/motel/slider_dots.dart';

class MockCarouselSliderController extends Mock
    implements CarouselSliderControllerImpl {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('MotelCarousel Widget Tests', () {
    late MockCarouselSliderController mockController;
    late List<MotelModel> dummyMotels;
    late PageController pageController;

    setUp(() {
      mockController = MockCarouselSliderController();
      pageController = PageController();
      dummyMotels = List.generate(3, (_) => MotelModel.empty());
    });

    testWidgets(
        '[MotelCarousel] renders correctly with motels and carousel controller',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MotelCarousel(
              motels: dummyMotels,
              pageController: pageController,
              carouselSliderController: mockController,
            ),
          ),
        ),
      );

      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byType(CarouselSlider), findsOneWidget);
      expect(find.byType(SliderDots), findsOneWidget);
    });

    testWidgets(
        '[MotelCarousel] slider dots are rendered with the correct number of dots',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MotelCarousel(
              motels: dummyMotels,
              pageController: pageController,
              carouselSliderController: mockController,
            ),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 500));

      expect(
        find.descendant(
          of: find.byType(SliderDots),
          matching: find.byType(GestureDetector),
        ),
        findsNWidgets(dummyMotels.length),
      );
    });
  });
}
