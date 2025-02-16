import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go/entities/categoria_item.dart';
import 'package:go/models/desconto_model.dart';
import 'package:go/models/item_model.dart';

import 'package:go/models/motel_model.dart';
import 'package:go/models/periodo_model.dart';
import 'package:go/models/suite_model.dart';
import 'package:go/widgets/suite/suite_category_item.dart';
import 'package:go/widgets/suite/suite_display.dart';
import 'package:go/widgets/suite/suite_header.dart';
import 'package:go/widgets/suite/suite_list_view.dart';
import 'package:go/widgets/suite/suite_periodos.dart';

void main() {
  group('[SuiteListView]', () {
    late List<MotelModel> motels;
    late PageController mockPageController;

    setUp(() {
      motels = [
        MotelModel(
          fantasia: 'Motel Teste',
          suites: [
            SuiteModel(
              nome: 'Suite Luxo',
              fotos: ['https://example.com/image.jpg'],
              exibirQtdDisponiveis: true,
              itens: [
                ItemModel(
                  nome: 'item',
                ),
              ],
              qtd: 200,
              categoriaItens: [
                CategoriaItem(
                  icone: 'https://example.com/image.jpg',
                  nome: 'Wifi',
                )
              ],
              periodos: [
                PeriodoModel(
                  tempoFormatado: '3 horas',
                  valorTotal: 88.0,
                  desconto: DescontoModel(
                    desconto: 48.0,
                  ),
                  temCortesia: false,
                  tempo: '3',
                  valor: 148.0,
                )
              ],
            ),
          ],
        ),
      ];
      mockPageController = PageController();
    });

    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SuiteListView(
              motels: motels,
              pageController: mockPageController,
            ),
          ),
        ),
      );

      expect(find.byType(ListView), findsNWidgets(2));
      expect(find.byType(SuiteHeader), findsOneWidget);
      expect(find.byType(PageView), findsOneWidget);
      expect(find.byType(SuiteDisplay), findsOneWidget);
      expect(find.byType(SuiteCateogoryItem), findsOneWidget);
      expect(find.byType(SuitePeriodos), findsOneWidget);
    });

    testWidgets('navigates to ImageGridPage when tapping on SuiteDisplay',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SuiteListView(
              motels: motels,
              pageController: mockPageController,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final suiteFinder = find.byType(SuiteDisplay);
      expect(suiteFinder, findsOneWidget);

      await tester.tap(suiteFinder);
      await tester.pumpAndSettle();
    });

    testWidgets(
        'navigates to CategoryItemPage when tapping on SuiteCategoryItem',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SuiteListView(
              motels: motels,
              pageController: mockPageController,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(SuiteCateogoryItem));
      await tester.pumpAndSettle();

      expect(find.byType(SuiteCateogoryItem), findsNothing);
    });
  });
}
