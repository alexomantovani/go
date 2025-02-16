import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:go/core/providers/toggle_provider.dart';
import 'package:go/views/under_construction_page.dart';
import 'package:go/widgets/common/custom_app_bar.dart';

void main() {
  testWidgets('[CustomAppBar] renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: CustomAppBar(),
        ),
      ),
    );

    expect(find.byType(AppBar), findsOneWidget);

    expect(find.byIcon(Icons.search_rounded), findsOneWidget);
    expect(find.byType(IconButton), findsNWidgets(2));

    expect(find.text('ir agora'), findsOneWidget);
    expect(find.text('ir outro dia'), findsOneWidget);
  });

  testWidgets('[ToggleButtons] toggles between "ir agora" and "ir outro dia"',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider(
          create: (_) => ToggleProvider(),
          child: Scaffold(
            appBar: CustomAppBar(),
          ),
        ),
      ),
    );

    final irOutroDiaFinder = find.text('ir outro dia');
    expect(irOutroDiaFinder, findsOneWidget);

    await tester.tap(irOutroDiaFinder);
    await tester.pump();

    final irAgoraFinder = find.text('ir agora');
    expect(irAgoraFinder, findsOneWidget);
  });

  testWidgets('Menu button navigates to [UnderConstructionPage]',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: CustomAppBar(),
        ),
        routes: {
          '/underConstruction': (context) => const UnderConstructionPage(),
        },
      ),
    );

    final menuButtonFinder = find.byType(IconButton).first;
    await tester.tap(menuButtonFinder);
    await tester.pumpAndSettle();

    expect(find.byType(UnderConstructionPage), findsOneWidget);
  });

  testWidgets('Search button navigates to [UnderConstructionPage]',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: CustomAppBar(),
        ),
        routes: {
          '/underConstruction': (context) => const UnderConstructionPage(),
        },
      ),
    );

    final searchButtonFinder = find.byIcon(Icons.search_rounded);
    await tester.tap(searchButtonFinder);
    await tester.pumpAndSettle();

    expect(find.byType(UnderConstructionPage), findsOneWidget);
  });

  testWidgets('Location button navigates to [UnderConstructionPage]',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: CustomAppBar(),
        ),
        routes: {
          '/underConstruction': (context) => const UnderConstructionPage(),
        },
      ),
    );

    final locationButtonFinder = find.text('zona norte');
    await tester.tap(locationButtonFinder);
    await tester.pumpAndSettle();

    expect(find.byType(UnderConstructionPage), findsOneWidget);
  });
}
