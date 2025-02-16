import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go/core/services/styles.dart';
import 'package:go/views/under_construction_page.dart';

void main() {
  testWidgets('[UnderConstructionPage] renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: UnderConstructionPage(),
      ),
    );

    expect(find.byType(Scaffold), findsOneWidget);
    final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
    expect(scaffold.backgroundColor, equals(Styles.kStandardWhite));

    expect(find.byType(AppBar), findsOneWidget);
    final appBar = tester.widget<AppBar>(find.byType(AppBar));
    expect(appBar.backgroundColor, equals(Styles.kStandardWhite));

    expect(find.byType(Center), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });
}
