import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:me/src/app/app.dart';

void main() {
  testWidgets('MyApp shows MainScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(MainScreen), findsOneWidget);
  });

  testWidgets('MainScreen has a VerticalNavBar and a PageView', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: MainScreen()));

    expect(find.byType(VerticalNavBar), findsOneWidget);
    expect(find.byType(PageView), findsOneWidget);
  });

  testWidgets('Tapping VerticalNavBar changes the page', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: MainScreen()));

    // Initially, HomePage should be visible
    expect(find.byType(HomePage), findsOneWidget);

    // Tap on the 'About' nav item
    await tester.tap(find.text('About'));
    await tester.pumpAndSettle();

    // Now, AboutPage should be visible
    expect(find.byType(AboutPage), findsOneWidget);
  });
}