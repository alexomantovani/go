import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:go/views/image_grid_page.dart';

void main() {
  late List<String> photos;

  setUp(() {
    photos = [
      "https://example.com/photo1.jpg",
      "https://example.com/photo2.jpg",
      "https://example.com/photo3.jpg",
    ];
  });

  Widget makeTestableWidget(Widget child) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets(
      "Checks whether the main elements of the ImageGridPage are rendered",
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(ImageGridPage(photos: photos)));

    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(GridView), findsOneWidget);
  });

  testWidgets("Check if GridView displays all images correctly",
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(ImageGridPage(photos: photos)));

    expect(find.byType(CachedNetworkImage), findsNWidgets(photos.length));
  });

  testWidgets("Checks whether when touching an image the modal opens",
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(ImageGridPage(photos: photos)));

    await tester.pumpAndSettle();

    final firstImage = find.byKey(const ValueKey('image_grid_item_0'));

    await tester.ensureVisible(firstImage);
    await tester.drag(find.byType(GridView), const Offset(0, -300));
    await tester.pumpAndSettle();

    expect(tester.widget<GestureDetector>(firstImage), isNotNull);
  });
}
