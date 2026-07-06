/// Lesson 03 — Control flow: conditionals, loops, and switch
///
///   dart run lessons/03_control_flow/main.dart
void main() {
  final score = 82;

  // if / else if / else
  if (score >= 90) {
    print('Grade: A');
  } else if (score >= 80) {
    print('Grade: B');
  } else {
    print('Keep going!');
  }

  // Classic for loop.
  for (var i = 1; i <= 3; i++) {
    print('for iteration $i');
  }

  // for-in over a collection.
  final languages = ['Dart', 'Flutter'];
  for (final lang in languages) {
    print('learning $lang');
  }

  // while loop.
  var countdown = 3;
  while (countdown > 0) {
    print('countdown $countdown');
    countdown--;
  }

  // switch — great for matching a value against known cases.
  final day = 'Sat';
  switch (day) {
    case 'Sat':
    case 'Sun':
      print('Weekend');
    default:
      print('Weekday');
  }
}
