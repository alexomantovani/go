import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:go/core/services/styles.dart';
import 'package:go/widgets/suite/suite_display.dart';

void main() {
  testWidgets('[SuiteDisplay] renders correctly with image and name',
      (WidgetTester tester) async {
    const testImage =
        'https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_2.jpg';
    const testName = 'Suite 101';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SuiteDisplay(
            image: testImage,
            name: testName,
          ),
        ),
      ),
    );

    expect(find.byType(CachedNetworkImage), findsOneWidget);
    expect(
        (tester.widget(find.byType(CachedNetworkImage)) as CachedNetworkImage)
            .imageUrl,
        equals(testImage));

    expect(find.text(testName), findsOneWidget);
  });

  testWidgets('[SuiteDisplay] does not render image if image is null',
      (WidgetTester tester) async {
    const testName = 'Suite 101';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SuiteDisplay(
            image: null,
            name: testName,
          ),
        ),
      ),
    );

    expect(find.byType(CachedNetworkImage), findsNothing);

    expect(find.text(testName), findsOneWidget);
  });

  testWidgets('[SuiteDisplay] applies correct styling',
      (WidgetTester tester) async {
    const testImage =
        'https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg';
    const testName = 'Suite 101';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SuiteDisplay(
            image: testImage,
            name: testName,
          ),
        ),
      ),
    );

    final containerFinder = find.byKey(const Key('suite_display_container'));
    expect(containerFinder, findsOneWidget);

    final container = tester.widget<Container>(containerFinder);

    final decoration = container.decoration as BoxDecoration;
    expect(decoration.color, equals(Styles.kStandardWhite));

    expect(container.padding, equals(EdgeInsets.all(12.0)));
  });
}
