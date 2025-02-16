import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go/widgets/suite/suite_header.dart';
import 'package:go/models/motel_model.dart';

void main() {
  final mockMotel = MotelModel(
    logo: 'https://example.com/logo.png',
    fantasia: 'Motel Fantasia',
    bairro: 'Zona Norte',
    media: 4.5,
    qtdAvaliacoes: 120,
  );

  testWidgets('[SuiteHeader] renders logo correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SuiteHeader(motel: mockMotel),
        ),
      ),
    );

    final imageFinder = find.byType(CachedNetworkImage);
    expect(imageFinder, findsOneWidget);

    final cachedNetworkImage = tester.widget<CachedNetworkImage>(imageFinder);
    expect(cachedNetworkImage.imageUrl, equals(mockMotel.logo));
  });

  testWidgets('[SuiteHeader] displays correct motel name and neighborhood',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SuiteHeader(motel: mockMotel),
        ),
      ),
    );

    expect(find.text(mockMotel.fantasia!), findsOneWidget);

    expect(find.text(mockMotel.bairro!), findsOneWidget);
  });

  testWidgets('[SuiteHeader] favorite button triggers action',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SuiteHeader(motel: mockMotel),
        ),
      ),
    );

    final favoriteButtonFinder = find.byType(IconButton);
    expect(favoriteButtonFinder, findsOneWidget);

    await tester.tap(favoriteButtonFinder);
    await tester.pump();
  });
}
