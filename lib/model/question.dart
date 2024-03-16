import 'package:signlearn/config.dart';

class Question {
  final String image;
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;

  Question({
    required this.image,
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
  });
}

class Option {
  final String text;
  final bool isCorrect;

  const Option({
    required this.text,
    required this.isCorrect,
  });
}

final questions = [
  Question(
    image: ,
    text:,
    options: [
      const Option(text: , isCorrect: ),
      const Option(text: , isCorrect: ),
      const Option(text: , isCorrect: ),
      const Option(text: , isCorrect: ),
    ],
  ),
];
