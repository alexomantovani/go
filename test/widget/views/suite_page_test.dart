import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go/models/motel_model.dart';
import 'package:go/views/suite_page.dart';
import 'package:go/widgets/suite/suite_list_view.dart';

void main() {
  late MotelModel motel;
  late PageController pageController;

  setUp(() {
    motel = MotelModel(
      fantasia: 'Motel Teste',
    );
    pageController = PageController();
  });

  Widget makeTestableWidget(Widget child) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets(
      "Verifica se os elementos principais da SuitePage são renderizados",
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(SuitePage(
      motel: motel,
      pageController: pageController,
    )));

    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byKey(const Key('suite_page_iconButton')), findsOneWidget);
    expect(find.byType(SuiteListView), findsOneWidget);
  });

  testWidgets("Verifica se o título do AppBar exibe o nome do motel",
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(SuitePage(
      motel: motel,
      pageController: pageController,
    )));

    final titleFinder = find.byKey(const Key('suite_page_motel_fantasia'));
    expect(titleFinder, findsOneWidget);

    final titleText = tester.widget<Text>(titleFinder);
    expect(titleText.data, equals(motel.fantasia));
  });

  testWidgets("Verifica se o botão de voltar fecha a página",
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(SuitePage(
      motel: motel,
      pageController: pageController,
    )));

    expect(find.byIcon(Icons.arrow_back_rounded), findsOneWidget);
    await tester.tap(find.byIcon(Icons.arrow_back_rounded));
    await tester.pumpAndSettle();

    expect(find.byType(SuitePage), findsNothing); // A página deve ser fechada
  });
}
