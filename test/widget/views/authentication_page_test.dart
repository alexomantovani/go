import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go/core/services/styles.dart';
import 'package:go/views/authentication_page.dart';

void main() {
  testWidgets('[AuthenticationPage] renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: AuthenticationPage(),
      ),
    );

    expect(find.byType(Scaffold), findsOneWidget);
    final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
    expect(scaffold.backgroundColor, equals(Styles.kPrimaryPale));

    expect(find.byType(AppBar), findsOneWidget);
    final appBar = tester.widget<AppBar>(find.byType(AppBar));
    expect(appBar.backgroundColor, equals(Styles.kPrimaryPale));

    expect(find.byType(Image), findsOneWidget);

    final kPrimaryRedContainerFinder =
        find.byKey(const Key('kPrimaryRed_container'));
    expect(kPrimaryRedContainerFinder, findsOneWidget);

    final kPrimaryRedContainer =
        tester.widget<Container>(kPrimaryRedContainerFinder);
    final kPrimaryRedDecoration =
        kPrimaryRedContainer.decoration as BoxDecoration;
    expect(kPrimaryRedDecoration.color, equals(Styles.kPrimaryRed));

    final kPrimaryAuthCardContainerFinder =
        find.byKey(const Key('kPrimaryAuthCard_container'));
    expect(kPrimaryAuthCardContainerFinder, findsOneWidget);

    final kPrimaryAuthCardContainer =
        tester.widget<Container>(kPrimaryAuthCardContainerFinder);
    final kPrimaryAuthCardDecoration =
        kPrimaryAuthCardContainer.decoration as BoxDecoration;
    expect(kPrimaryAuthCardDecoration.color, equals(Styles.kPrimaryAuthCard));
  });

  testWidgets('Checks if page pops back when Icons.close_rounded is tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Navigator(
          onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => const AuthenticationPage(),
          ),
        ),
      ),
    );

    // Verificar se a AuthenticationPage está na árvore de widgets
    expect(find.byType(AuthenticationPage), findsOneWidget);

    // Simular o clique no botão de voltar (leading do AppBar)
    await tester.tap(find.byIcon(Icons.close_rounded));
    await tester.pumpAndSettle(); // Aguarda a animação de navegação

    // Verificar se a AuthenticationPage foi removida da árvore de widgets
    expect(find.byType(AuthenticationPage), findsNothing);
  });
}
