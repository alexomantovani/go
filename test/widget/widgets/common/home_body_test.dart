import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:go/core/services/styles.dart';
import 'package:go/models/motel_model.dart';
import 'package:go/widgets/common/home_body.dart';
import 'package:go/widgets/motel/motel_carousel.dart';
import 'package:go/widgets/suite/suite_list_view.dart';

void main() {
  late PageController pageController;
  late CarouselSliderController carouselSliderController;
  late List<MotelModel> motels;

  setUp(() {
    pageController = PageController();
    carouselSliderController = CarouselSliderController();
    motels = [
      MotelModel.empty().copyWith(fantasia: 'Motel A'),
      MotelModel.empty().copyWith(fantasia: 'Motel B'),
    ];
  });

  testWidgets('[HomeBody] renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HomeBody(
            pageController: pageController,
            carouselSliderController: carouselSliderController,
            motels: motels,
          ),
        ),
      ),
    );

    expect(
        find.byWidgetPredicate((widget) =>
            widget is Container &&
            widget.decoration is BoxDecoration &&
            (widget.decoration as BoxDecoration).color == Styles.kPrimaryPale),
        findsOneWidget);

    expect(find.byType(MotelCarousel), findsOneWidget);

    expect(find.byType(SuiteListView), findsOneWidget);
  });

  testWidgets('[HomeBody] has correct background color',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HomeBody(
            pageController: pageController,
            carouselSliderController: carouselSliderController,
            motels: motels,
          ),
        ),
      ),
    );

    final container = tester.widget<Container>(find.byWidgetPredicate(
        (widget) =>
            widget is Container &&
            widget.decoration is BoxDecoration &&
            (widget.decoration as BoxDecoration).color == Styles.kPrimaryPale));

    final BoxDecoration? decoration = container.decoration as BoxDecoration?;
    expect(decoration, isNotNull);
    expect(decoration?.color, equals(Styles.kPrimaryPale));
  });

  testWidgets('[HomeBody] has rounded top corners',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HomeBody(
            pageController: pageController,
            carouselSliderController: carouselSliderController,
            motels: motels,
          ),
        ),
      ),
    );

    final container = tester.widget<Container>(find.byWidgetPredicate(
        (widget) =>
            widget is Container &&
            widget.decoration is BoxDecoration &&
            (widget.decoration as BoxDecoration).color == Styles.kPrimaryPale));

    final BoxDecoration? decoration = container.decoration as BoxDecoration?;
    expect(decoration?.borderRadius, isNotNull);

    final borderRadius = decoration?.borderRadius as BorderRadius;
    expect(borderRadius.topLeft, const Radius.circular(24));
    expect(borderRadius.topRight, const Radius.circular(24));
  });

  testWidgets('[HomeBody] has a scrollable view', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HomeBody(
            pageController: pageController,
            carouselSliderController: carouselSliderController,
            motels: motels,
          ),
        ),
      ),
    );

    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });
}
