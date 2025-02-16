import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go/core/providers/motel_carousel_provider.dart';
import 'package:go/models/motel_model.dart';
import 'package:go/models/suite_model.dart';
import 'package:go/widgets/motel/motel_carousel_item.dart';
import 'package:go/widgets/motel/motel_details_header.dart';
import 'package:provider/provider.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('MotelCarouselItem tests', () {
    late MotelModel motelWithPhoto;
    late MotelModel motelWithoutPhoto;
    late MotelCarouselProvider providerWithPhoto;
    late MotelCarouselProvider providerWithoutPhoto;

    setUp(() {
      final tMap = jsonDecode(fixture('data.json')) as Map<String, dynamic>;
      motelWithPhoto = MotelModel.fromMap(tMap);

      providerWithPhoto = MotelCarouselProvider();
      providerWithPhoto.setMotelCarouselItemInfo(motel: motelWithPhoto);

      motelWithoutPhoto = MotelModel(
        fantasia: 'Motel Sem Foto',
        bairro: 'Bairro Teste',
        suites: [
          SuiteModel(fotos: []),
        ],
      );
      providerWithoutPhoto = MotelCarouselProvider();
      providerWithoutPhoto.setMotelCarouselItemInfo(motel: motelWithoutPhoto);
    });

    testWidgets('[MotelCarouselItem] renders correctly when photo is available',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider<MotelCarouselProvider>.value(
          value: providerWithPhoto,
          child: MaterialApp(
            home: Scaffold(
              body: MotelCarouselItem(motel: motelWithPhoto),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(CachedNetworkImage), findsOneWidget);

      expect(find.text(motelWithPhoto.fantasia!), findsOneWidget);
      expect(find.text(motelWithPhoto.bairro!), findsOneWidget);

      expect(find.byType(MotelDetailsHeader), findsOneWidget);
    });

    testWidgets(
        '[MotelCarouselItem] renders nothing when lastSuiteFirstPhoto is null',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider<MotelCarouselProvider>.value(
          value: providerWithoutPhoto,
          child: MaterialApp(
            home: Scaffold(
              body: MotelCarouselItem(motel: motelWithoutPhoto),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Row), findsNothing);
      expect(find.byType(CachedNetworkImage), findsNothing);
      expect(find.byType(MotelDetailsHeader), findsNothing);
    });

    testWidgets(
        '[MotelCarouselItem] renders image and details when photo is available',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider<MotelCarouselProvider>.value(
          value: providerWithPhoto,
          child: MaterialApp(
            home: Scaffold(
              body: MotelCarouselItem(motel: motelWithPhoto),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(CachedNetworkImage), findsOneWidget);
      expect(find.byType(MotelDetailsHeader), findsOneWidget);
    });
  });
}
