import 'package:flutter_test/flutter_test.dart';
import 'package:me/src/app/app.dart';

void main() {
  testWidgets('MyApp shows MainScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(MainScreen), findsOneWidget);
  });
}