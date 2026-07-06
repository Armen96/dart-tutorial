/// Example reusable library.
///
/// Code under `lib/` is importable from anywhere in the package (and from
/// tests) using the package name declared in `pubspec.yaml`:
///
///   import 'package:dart_tutorial/calculator.dart';
///
/// This separation — reusable code in `lib/`, experiments in `lessons/`,
/// verification in `test/` — is the standard shape of a Dart package.
library;

/// Returns the sum of [a] and [b].
int add(int a, int b) => a + b;

/// Returns [a] minus [b].
int subtract(int a, int b) => a - b;
