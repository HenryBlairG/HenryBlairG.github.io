import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:me/src/features/home/presentation/view/home_page.dart';
import 'package:mockito/mockito.dart';


import 'mocks.mocks.dart';

void main() {
  late MockHomeService mockHomeService;

  setUp(() {
    mockHomeService = MockHomeService();
  });

  testWidgets('MyHomePage displays initial counter value', (WidgetTester tester) async {
    when(mockHomeService.counter).thenReturn(ValueNotifier(0));

    await tester.pumpWidget(
      MaterialApp(
        home: MyHomePage(
          title: 'Test Home Page',
          homeService: mockHomeService,
        ),
      ),
    );

    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('MyHomePage increments counter on button press', (WidgetTester tester) async {
    final counter = ValueNotifier(0);
    when(mockHomeService.counter).thenReturn(counter);
    when(mockHomeService.incrementCounter()).thenAnswer((_) {
      counter.value++;
    });

    await tester.pumpWidget(
      MaterialApp(
        home: MyHomePage(
          title: 'Test Home Page',
          homeService: mockHomeService,
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
    verify(mockHomeService.incrementCounter()).called(1);
  });
}
