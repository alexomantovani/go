import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go/core/services/styles.dart';
import 'package:go/widgets/motel/motel_details_body.dart';

void main() {
  testWidgets(
      '[MotelDetailsBody] renders correctly with given price and discount',
      (WidgetTester tester) async {
    const double lowestPrice = 199.99;
    const double discount = 20.0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MotelDetailsBody(
            lowestPrice: lowestPrice,
            discount: discount,
          ),
        ),
      ),
    );

    expect(find.text('20% de desconto'), findsOneWidget);

    expect(find.text('a partir de R\$199.99'), findsOneWidget);

    expect(find.text('reservar'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_forward_ios_rounded), findsOneWidget);
  });

  testWidgets(
      '[MotelDetailsBody] displays correct styles for discount and price',
      (WidgetTester tester) async {
    const double lowestPrice = 199.99;
    const double discount = 20.0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MotelDetailsBody(
            lowestPrice: lowestPrice,
            discount: discount,
          ),
        ),
      ),
    );

    final discountText = tester.widget<Text>(find.text('20% de desconto'));
    expect(discountText.style!.decoration, TextDecoration.underline);
    expect(discountText.style!.color, Styles.kPrimaryText);
    expect(discountText.style!.fontWeight, FontWeight.bold);

    final priceText = tester.widget<Text>(find.text('a partir de R\$199.99'));
    expect(priceText.style!.fontSize, 11);
  });

  testWidgets('[MotelDetailsBody] "reservar" button navigates when tapped',
      (WidgetTester tester) async {
    const double lowestPrice = 199.99;
    const double discount = 20.0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MotelDetailsBody(
            lowestPrice: lowestPrice,
            discount: discount,
          ),
        ),
      ),
    );

    final reservarButton = find.text('reservar');
    expect(reservarButton, findsOneWidget);

    await tester.tap(reservarButton);
    await tester.pumpAndSettle();
  });

  testWidgets('[MotelDetailsBody] renders correctly with zero discount',
      (WidgetTester tester) async {
    const double lowestPrice = 150.0;
    const double discount = 0.0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MotelDetailsBody(
            lowestPrice: lowestPrice,
            discount: discount,
          ),
        ),
      ),
    );

    expect(find.text('0% de desconto'), findsOneWidget);

    expect(find.text('a partir de R\$150.0'), findsOneWidget);
  });
}
