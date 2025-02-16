import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:go/core/providers/motel_carousel_provider.dart';
import 'package:go/widgets/common/modal_carousel.dart';

void main() {
  late List<String> photos;

  setUp(() {
    photos = [
      "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg",
      "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_2.jpg",
      "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_3.jpg",
      "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_4.jpg"
    ];
  });

  testWidgets('[ModalCarousel] renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ModalCarousel(photos: photos),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(ModalCarousel), findsOneWidget);

    expect(find.byType(PageView), findsOneWidget);

    expect(find.byIcon(Icons.close_rounded), findsOneWidget);

    final pageView = tester.widget<PageView>(find.byType(PageView));
    final delegate = pageView.childrenDelegate;
    if (delegate is SliverChildBuilderDelegate) {
      expect(delegate.estimatedChildCount, equals(photos.length));
    } else {
      fail('O delegate do PageView não é SliverChildBuilderDelegate');
    }
  });

  testWidgets('[ModalCarousel] closes when the close button is tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ModalCarousel(photos: photos),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.close_rounded));
    await tester.pumpAndSettle();

    expect(find.byType(ModalCarousel), findsNothing);
  });

  testWidgets('[ModalCarousel] can navigate through photos',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ModalCarousel(photos: photos),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.arrow_forward_ios_rounded));
    await tester.pumpAndSettle();

    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.arrow_back_ios_new_rounded));
    await tester.pumpAndSettle();

    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('[ModalCarousel] cannot navigate before the first photo',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ModalCarousel(photos: photos),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.arrow_back_ios_new_rounded));
    await tester.pumpAndSettle();

    final backButtonFinder = find.ancestor(
      of: find.byIcon(Icons.arrow_back_ios_new_rounded),
      matching: find.byType(IconButton),
    );

    final IconButton backButton = tester.widget<IconButton>(backButtonFinder);
    expect(backButton.onPressed, isNull);
  });

  testWidgets('[ModalCarousel] cannot navigate after the last photo',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ModalCarousel(photos: photos),
        ),
      ),
    );

    await tester.pumpAndSettle();

    final descendantContext = tester.element(find.byType(PageView));
    final provider =
        Provider.of<MotelCarouselProvider>(descendantContext, listen: false);

    provider.setPageIndex(photos.length - 1);
    await tester.pumpAndSettle();

    final forwardButtonFinder = find.ancestor(
      of: find.byIcon(Icons.arrow_forward_ios_rounded),
      matching: find.byType(IconButton),
    );
    final IconButton forwardButton =
        tester.widget<IconButton>(forwardButtonFinder);

    expect(forwardButton.onPressed, isNull);
  });
}
