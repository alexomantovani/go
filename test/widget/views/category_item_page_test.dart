import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:go/models/categoria_item_model.dart';
import 'package:go/models/item_model.dart';
import 'package:go/models/suite_model.dart';
import 'package:go/views/category_item_page.dart';

void main() {
  late SuiteModel suite;

  setUp(() {
    suite = SuiteModel(
      nome: "Suíte Luxo",
      categoriaItens: [
        CategoriaItemModel(nome: "TV", icone: "https://example.com/tv.png"),
        CategoriaItemModel(
            nome: "Banheira", icone: "https://example.com/bath.png"),
      ],
      itens: [
        ItemModel(nome: "Ar-condicionado"),
        ItemModel(nome: "Wi-Fi grátis"),
      ],
    );
  });

  Widget makeTestableWidget(Widget child) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets("Check if key elements are rendered",
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(CategoryItemPage(suite: suite)));

    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
  });

  testWidgets("Verifies that the suite name is displayed correctly",
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(CategoryItemPage(suite: suite)));

    expect(find.text("Suíte Luxo"), findsOneWidget);
  });

  testWidgets("Verifies that key items are displayed correctly",
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(CategoryItemPage(suite: suite)));

    expect(find.text("principais itens"), findsOneWidget);
    expect(find.text("TV"), findsOneWidget);
    expect(find.text("Banheira"), findsOneWidget);
  });

  testWidgets("Checks if category icons are loaded",
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(CategoryItemPage(suite: suite)));

    expect(find.byType(CachedNetworkImage),
        findsNWidgets(suite.categoriaItens!.length));
  });

  testWidgets("Verifies that additional items are displayed correctly",
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(CategoryItemPage(suite: suite)));

    expect(find.text("tem também"), findsOneWidget);
    expect(find.text("Ar-condicionado,"), findsOneWidget);
    expect(find.text("Wi-Fi grátis,"), findsOneWidget);
  });
}
