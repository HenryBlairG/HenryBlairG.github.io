import 'package:flutter_test/flutter_test.dart';
import 'package:me/src/features/home/application/home_service.dart';

void main() {
  group('HomeService', () {
    late HomeService homeService;

    setUp(() {
      homeService = HomeService();
    });

    tearDown(() {
      homeService.dispose();
    });

    test('initial counter value is 0', () {
      expect(homeService.counter.value, 0);
    });

    test('incrementCounter increases counter value by 1', () {
      homeService.incrementCounter();
      expect(homeService.counter.value, 1);
    });
  });
}
