import 'package:dart_tutorial/calculator.dart';
import 'package:test/test.dart';

/// Run the whole suite with:  dart test
void main() {
  group('calculator', () {
    test('add returns the sum of two integers', () {
      expect(add(2, 3), equals(5));
    });

    test('subtract returns the difference of two integers', () {
      expect(subtract(5, 3), equals(2));
    });
  });
}
