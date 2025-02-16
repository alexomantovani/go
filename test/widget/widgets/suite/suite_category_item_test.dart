import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:go/entities/categoria_item.dart';
import 'package:go/widgets/suite/suite_category_item.dart';

void main() {
  group('[SuiteCateogoryItem]', () {
    final categoriaItens = [
      CategoriaItem(icone: 'https://example.com/icon1.png'),
      CategoriaItem(icone: 'https://example.com/icon2.png'),
      CategoriaItem(icone: 'https://example.com/icon3.png'),
      CategoriaItem(icone: 'https://example.com/icon4.png'),
      CategoriaItem(icone: 'https://example.com/icon5.png'),
    ];

    testWidgets('renders correctly with category icons',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SuiteCateogoryItem(categoriaItens: categoriaItens),
          ),
        ),
      );

      expect(find.byType(CachedNetworkImage), findsNWidgets(4));

      expect(find.text('ver todos'), findsOneWidget);
      expect(find.byIcon(Icons.keyboard_arrow_down_rounded), findsOneWidget);
    });

    testWidgets('hides icons beyond the fourth', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SuiteCateogoryItem(categoriaItens: categoriaItens),
          ),
        ),
      );

      // Verifica que apenas 4 imagens são renderizadas, não 5
      expect(find.byType(CachedNetworkImage), findsNWidgets(4));
    });
  });
}
