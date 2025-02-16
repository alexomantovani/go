import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:go/widgets/common/custom_floating_button.dart';
import 'package:go/views/under_construction_page.dart';

void main() {
  testWidgets('[CustomFloatingButton] renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          floatingActionButton: CustomFloatingButton(
            label: 'teste',
            iconData: Icons.check,
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byIcon(Icons.check), findsOneWidget);
    expect(find.text('teste'), findsOneWidget);
  });

  testWidgets('[CustomFloatingButton] calls onPressed when tapped',
      (WidgetTester tester) async {
    bool wasPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          floatingActionButton: CustomFloatingButton(
            onPressed: () {
              wasPressed = true;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    expect(wasPressed, isTrue);
  });

  testWidgets('[CustomFloatingButton] navigates to [UnderConstructionPage]',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          floatingActionButton: CustomFloatingButton(
            onPressed: () {
              Navigator.pushNamed(
                  tester.element(find.byType(FloatingActionButton)),
                  '/underConstruction');
            },
          ),
        ),
        routes: {
          '/underConstruction': (context) => const UnderConstructionPage(),
        },
      ),
    );

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.byType(UnderConstructionPage), findsOneWidget);
  });
}
