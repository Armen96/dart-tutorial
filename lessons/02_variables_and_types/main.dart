/// Lesson 02 — Variables, types, and null safety
///
///   dart run lessons/02_variables_and_types/main.dart
void main() {
  // `var` infers the type from the value. Here `name` is a String.
  var name = 'Armen';

  // `final` can be assigned once (at runtime). Prefer it by default.
  final year = 2026;

  // `const` is a compile-time constant — the value must be known up front.
  const pi = 3.14159;

  // You can also annotate the type explicitly when it aids clarity.
  int count = 3;
  double temperature = 21.5;
  bool isLearning = true;

  print('$name is learning Dart in $year');
  print('pi=$pi, count=$count, temp=$temperature, learning=$isLearning');

  // Null safety: a plain type can never hold null...
  String greeting = 'hi';
  // greeting = null; // <-- would not compile.
  print(greeting);

  // ...add `?` to allow null explicitly.
  String? maybeNickname;
  print('nickname is ${maybeNickname ?? "not set"}'); // ?? = null-coalescing
}
