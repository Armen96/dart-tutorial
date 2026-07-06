# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A personal learning playground for the **Dart language** and **Flutter framework**, deliberately structured as a real Dart package (`dart_tutorial`) so professional conventions are practiced from the start. Code here is pedagogical, not production — clarity and demonstrating a concept matter more than terseness.

## Commands

Run from the repo root (the root is a pure-Dart package — use the `dart` toolchain, not `flutter`):

```bash
dart pub get                                    # fetch dependencies
dart run lessons/01_hello_world/main.dart       # run a lesson
dart analyze                                    # static analysis — must be clean before committing
dart format .                                   # format everything (not optional; keep the repo consistent)
dart test                                       # run all tests in test/
dart test test/calculator_test.dart             # run one test file
dart test --name 'add returns'                  # run tests matching a name pattern
dart pub add <name>                             # add a dependency (edits pubspec.yaml)
```

## Architecture

The directory layout mirrors a standard Dart package so nothing has to be unlearned later. Each top-level folder plays a distinct role:

- **`lessons/`** — language experiments, one concept per numbered folder (`01_`, `02_`…), each a standalone runnable `main.dart`. These are scratch programs, not imported by anything.
- **`lib/`** — reusable code, importable anywhere (including tests) via `package:dart_tutorial/<file>.dart`. When a lesson produces something worth keeping, it graduates to `lib/` with a matching test. The package name comes from `pubspec.yaml`.
- **`test/`** — tests for `lib/` code; files **must** end in `_test.dart` to be discovered by `dart test`.
- **`apps/`** — Flutter apps, each its **own self-contained package** with its own `pubspec.yaml`. Created with `flutter create apps/<name>`. Inside an app, use the `flutter` toolchain (`flutter pub get`, `flutter test`, `flutter run`), never the root `dart` commands.

Key consequence to remember: **`apps/**` and `build/**` are excluded from the root analyzer** (see `analysis_options.yaml`) precisely because Flutter apps manage their own analysis and dependencies. Don't move Flutter code into the root package.

## Conventions specific to this repo

- Lints are `package:lints/recommended.yaml` plus **strict-casts and strict-raw-types promoted to errors**, and `prefer_single_quotes` — so use single quotes and expect the analyzer to be strict.
- `prefer_final_locals` is intentionally **left off**: several lessons use `var` on purpose to contrast mutable variables with `final`/`const`. Don't "fix" those by making them final.
- Every lesson `main.dart` opens with a `///` doc comment naming the topic and giving the exact `dart run` command for it — follow that template when adding lessons.
- `README.md` holds the learning roadmap and the fuller rationale for the structure.
