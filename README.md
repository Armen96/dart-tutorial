# dart-tutorial

> A personal, hands-on playground for learning the **Dart** language and the **Flutter** framework — organized as a proper Dart package so good habits are baked in from day one.

Each concept lives in its own small, runnable file. Reusable code sits in a real
library with tests, and Flutter apps grow alongside as separate projects. The
goal is not just to learn the syntax, but to learn the *shape* of a professional
Dart/Flutter project.

---

## Contents

- [Prerequisites](#prerequisites)
- [Getting started](#getting-started)
- [Repository structure](#repository-structure)
- [How this repo is organized (and why)](#how-this-repo-is-organized-and-why)
- [Common commands](#common-commands)
- [Adding a new lesson](#adding-a-new-lesson)
- [Building Flutter apps](#building-flutter-apps)
- [Learning roadmap](#learning-roadmap)
- [Conventions](#conventions)
- [Resources](#resources)

---

## Prerequisites

You need the Dart SDK (which ships inside Flutter) installed. This repo was
developed with:

| Tool    | Version |
| ------- | ------- |
| Dart    | 3.12.x  |
| Flutter | 3.44.x  |

Check what you have:

```bash
dart --version
flutter --version
flutter doctor   # verifies your full toolchain (Xcode, Android SDK, devices)
```

If you don't have Flutter yet, install it from the official guide (installing
Flutter also gives you Dart): <https://docs.flutter.dev/get-started/install>

---

## Getting started

```bash
# 1. Fetch dependencies declared in pubspec.yaml
dart pub get

# 2. Run your first lesson
dart run lessons/01_hello_world/main.dart

# 3. Make sure everything is healthy
dart analyze     # static analysis — should say "No issues found!"
dart test        # runs the example test suite
```

---

## Repository structure

```
dart-tutorial/
├── pubspec.yaml            # Package manifest: name, SDK constraint, dependencies
├── pubspec.lock            # Resolved dependency versions (generated)
├── analysis_options.yaml   # Linter + analyzer rules (code-quality guardrails)
├── .gitignore              # Ignores build artifacts, .dart_tool/, secrets, etc.
│
├── lessons/                # Dart language, one concept per folder — runnable
│   ├── 01_hello_world/
│   │   └── main.dart
│   ├── 02_variables_and_types/
│   │   └── main.dart
│   └── 03_control_flow/
│       └── main.dart
│
├── lib/                    # Reusable code, importable as package:dart_tutorial/...
│   └── calculator.dart
│
├── test/                   # Automated tests for code in lib/
│   └── calculator_test.dart
│
└── apps/                   # Flutter apps — each is its own self-contained package
    └── README.md           # How to create an app here
```

---

## How this repo is organized (and why)

This layout mirrors what a real Dart package looks like, so nothing has to be
"unlearned" later.

- **`lessons/`** — a scratchpad for the *language*. Each folder is a tiny,
  self-contained program you can run and tweak. Numbering (`01_`, `02_`…) keeps
  them in learning order. These are experiments, not production code.
- **`lib/`** — where *reusable* code belongs in every Dart package. Anything here
  is importable from tests and other files via
  `import 'package:dart_tutorial/<file>.dart';`. Use it when a lesson grows into
  something worth keeping and testing.
- **`test/`** — automated tests. Learning to test early is one of the highest-value
  habits you can build. Files must end in `_test.dart` to be discovered.
- **`apps/`** — the *Flutter* side. Flutter apps are full packages with their own
  `pubspec.yaml`, so they live in subfolders here and are excluded from the root
  analyzer. See [`apps/README.md`](apps/README.md).
- **`pubspec.yaml`** — the heart of any Dart project: it names the package, pins
  the SDK version, and lists dependencies. Add packages with `dart pub add`.
- **`analysis_options.yaml`** — turns on the community-standard lints plus a few
  extra guardrails so the editor nudges you toward idiomatic Dart as you type.

---

## Common commands

| Task                               | Command                                          |
| ---------------------------------- | ------------------------------------------------ |
| Install / update dependencies      | `dart pub get`                                   |
| Add a package                      | `dart pub add <name>` (e.g. `dart pub add http`) |
| Run a specific lesson              | `dart run lessons/03_control_flow/main.dart`     |
| Run static analysis                | `dart analyze`                                   |
| Auto-format all code               | `dart format .`                                  |
| Run all tests                      | `dart test`                                      |
| Run one test file                  | `dart test test/calculator_test.dart`            |
| See outdated dependencies          | `dart pub outdated`                              |
| Open interactive scratchpad online | <https://dartpad.dev>                            |

> Tip: `dart format .` before committing keeps the whole repo consistent, and
> `dart analyze` should always return **"No issues found!"** before you commit.

---

## Adding a new lesson

1. Create a numbered folder under `lessons/`, e.g. `lessons/04_functions/`.
2. Add a `main.dart` with a top-level `void main()` and a short doc comment at the
   top explaining what the lesson covers and the command to run it.
3. Run it: `dart run lessons/04_functions/main.dart`.
4. When a concept produces something reusable (a function, a class), move that
   piece into `lib/` and write a matching `*_test.dart` in `test/`.

Template to start from:

```dart
/// Lesson NN — <topic>
///
///   dart run lessons/NN_<topic>/main.dart
void main() {
  // ...experiment here...
}
```

---

## Building Flutter apps

The root package is for Dart *fundamentals*. Flutter apps are separate packages,
so create them under `apps/`:

```bash
flutter create apps/hello_flutter
cd apps/hello_flutter
flutter run          # pick a device / simulator / Chrome
```

Inside a Flutter app you'll use the Flutter tools instead of the Dart ones:
`flutter pub get`, `flutter analyze`, `flutter test`, `flutter run`,
`flutter build`. See [`apps/README.md`](apps/README.md) for details.

---

## Learning roadmap

A suggested path. Check things off as you build a lesson (and, where it makes
sense, a `lib/` + `test/` pair) for each.

**Dart fundamentals**
- [x] Hello, World! & the `main()` entry point
- [x] Variables, types, and null safety
- [x] Control flow (`if`, loops, `switch`)
- [ ] Functions (parameters, named/optional args, arrow syntax, closures)
- [ ] Collections (`List`, `Set`, `Map`) and iterables
- [ ] Classes, constructors, getters/setters
- [ ] Inheritance, `abstract`, `mixin`, interfaces
- [ ] Enums and pattern matching / records
- [ ] Generics
- [ ] Error handling (`try` / `catch` / `finally`, custom exceptions)
- [ ] Asynchronous Dart (`Future`, `async` / `await`, `Stream`)

**Flutter**
- [ ] First app & the widget tree (`StatelessWidget` vs `StatefulWidget`)
- [ ] Layout widgets (`Row`, `Column`, `Container`, `Stack`)
- [ ] Handling input & `setState`
- [ ] Navigation & routing
- [ ] Lists & scrolling (`ListView`, `GridView`)
- [ ] Networking (the `http` package) & JSON parsing
- [ ] State management (start simple, then explore `Provider` / `Riverpod` / `Bloc`)
- [ ] Persistence & widget testing

---

## Conventions

- **Formatting** is not a matter of taste — run `dart format .`.
- **Strings** use single quotes (`'like this'`).
- **Prefer `final`** for values that don't change; the lessons use `var` only
  when deliberately demonstrating mutability.
- **Keep `dart analyze` green** — treat warnings as work to do, not noise.
- **Naming**: `lowerCamelCase` for variables/functions, `UpperCamelCase` for
  types, `lowercase_with_underscores` for files and folders.

These mirror the official [Effective Dart](https://dart.dev/effective-dart) style
guide — worth reading once you're comfortable with the basics.

---

## Resources

- Dart language tour — <https://dart.dev/language>
- Effective Dart (style guide) — <https://dart.dev/effective-dart>
- Flutter docs — <https://docs.flutter.dev>
- Flutter widget catalog — <https://docs.flutter.dev/ui/widgets>
- Package registry — <https://pub.dev>
- DartPad (run Dart/Flutter in the browser) — <https://dartpad.dev>
