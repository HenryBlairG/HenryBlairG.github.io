import 'package:flutter_test/flutter_test.dart';
import 'package:me/src/app/app.dart';

void main() {
  testWidgets('MyApp builds without errors', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(MyApp), findsOneWidget);
  });
}
