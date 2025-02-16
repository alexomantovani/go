import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:go/core/providers/motel_carousel_provider.dart';
import 'package:go/models/motel_model.dart';
import 'package:go/widgets/motel/motel_details_body.dart';
import 'package:go/widgets/motel/motel_details_header.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('MotelDetailsHeader tests', () {
    late MotelModel motelWithDetails;
    late MotelModel motelWithoutDetails;
    late MotelCarouselProvider providerWithDetails;
    late MotelCarouselProvider providerWithoutDetails;

    setUp(() {
      final tMap = jsonDecode(fixture('data.json')) as Map<String, dynamic>;
      motelWithDetails = MotelModel.fromMap(tMap);

      providerWithDetails = MotelCarouselProvider();
      providerWithDetails.setMotelCarouselItemInfo(motel: motelWithDetails);

      motelWithoutDetails = MotelModel(
        fantasia: 'Motel Sem Detalhes',
        bairro: 'Bairro Teste',
      );
      providerWithoutDetails = MotelCarouselProvider();
      providerWithoutDetails.setMotelCarouselItemInfo(
          motel: motelWithoutDetails);
    });

    testWidgets('[MotelDetailsHeader] renders correctly with motel details',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider<MotelCarouselProvider>.value(
          value: providerWithDetails,
          child: MaterialApp(
            home: Scaffold(
              body: MotelDetailsHeader(provider: providerWithDetails),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text(motelWithDetails.fantasia!), findsOneWidget);
      expect(find.text(motelWithDetails.bairro!), findsOneWidget);

      expect(find.byIcon(Icons.local_fire_department), findsOneWidget);

      expect(find.byType(MotelDetailsBody), findsOneWidget);
    });

    testWidgets(
        '[MotelDetailsHeader] renders default state when motel details are missing',
        (WidgetTester tester) async {
      final providerWithDefaultDetails = MotelCarouselProvider();
      providerWithDefaultDetails.setMotelCarouselItemInfo(
        motel: MotelModel(
          fantasia: '',
          bairro: '',
        ),
      );

      await tester.pumpWidget(
        ChangeNotifierProvider<MotelCarouselProvider>.value(
          value: providerWithDefaultDetails,
          child: MaterialApp(
            home: Scaffold(
              body: MotelDetailsHeader(provider: providerWithDefaultDetails),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text(''), findsNWidgets(2));

      expect(find.byIcon(Icons.local_fire_department), findsOneWidget);

      expect(find.byType(MotelDetailsBody), findsOneWidget);
    });
  });
}
