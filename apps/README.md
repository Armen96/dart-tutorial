# Flutter apps

Each Flutter app is its **own self-contained package** (its own `pubspec.yaml`),
so keep them here as separate subfolders rather than mixing them into the
Dart-fundamentals package at the repo root.

## Create a new app

From the repo root:

```bash
flutter create apps/hello_flutter
cd apps/hello_flutter
flutter run          # launches on a connected device / simulator / Chrome
```

## Notes

- The root analyzer ignores everything under `apps/` (see `analysis_options.yaml`)
  because each app manages its own analysis and dependencies.
- Run `flutter doctor` once to confirm your toolchain (Xcode, Android SDK,
  device/simulator) is set up.
