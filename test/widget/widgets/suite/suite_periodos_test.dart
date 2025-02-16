import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go/models/periodo_model.dart';
import 'package:go/views/under_construction_page.dart';
import 'package:go/widgets/suite/suite_periodos.dart';

void main() {
  testWidgets('[SuitePeriodos] renders periodos list correctly',
      (WidgetTester tester) async {
    final mockPeriodos = [
      PeriodoModel(tempoFormatado: '3 horas', valorTotal: 50.0),
      PeriodoModel(tempoFormatado: '12 horas', valorTotal: 75.0),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SuitePeriodos(periodos: mockPeriodos),
        ),
      ),
    );

    expect(find.byType(TextButton), findsNWidgets(mockPeriodos.length));

    expect(find.text('3 horas'), findsOneWidget);
    expect(find.text('12 horas'), findsOneWidget);

    expect(find.text('R\$50,00'), findsOneWidget);
    expect(find.text('R\$75,00'), findsOneWidget);
  });

  testWidgets('[SuitePeriodos] navigates on button press',
      (WidgetTester tester) async {
    final mockPeriodos = [
      PeriodoModel(tempoFormatado: '10:00 - 12:00', valorTotal: 50.0),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SuitePeriodos(periodos: mockPeriodos),
        ),
        routes: {
          '/underConstruction': (context) => const UnderConstructionPage(),
        },
      ),
    );

    final buttonFinder = find.byType(TextButton);
    await tester.tap(buttonFinder);
    await tester.pumpAndSettle();

    expect(find.byType(UnderConstructionPage), findsOneWidget);
  });

  testWidgets('[SuitePeriodos] handles empty periodos list',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SuitePeriodos(periodos: []),
        ),
      ),
    );

    expect(find.byType(TextButton), findsNothing);
  });

  testWidgets('[SuitePeriodos] applies correct styling',
      (WidgetTester tester) async {
    final mockPeriodos = [
      PeriodoModel(tempoFormatado: '10:00 - 12:00', valorTotal: 50.0),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SuitePeriodos(periodos: mockPeriodos),
        ),
      ),
    );

    final containerFinder = find.byType(Container);
    final container = tester.firstWidget(containerFinder) as Container;
    final decoration = container.decoration as BoxDecoration;
    expect(decoration.borderRadius, BorderRadius.circular(6.0));
  });
}
