import 'package:signlearn/config.dart';

class Question{
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

class Option{
  final String text;
  final bool isCorrect;

  const Option({
    required this.text,
    required this.isCorrect,
  });
}

final questions = [
  Question(
    image: "${Config.server}/signlearn/assets/c1/13.png",
    text: "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'N', isCorrect: false),
      const Option(text: 'B', isCorrect: false),
      const Option(text: 'M', isCorrect: true),
      const Option(text: 'C', isCorrect: false),
    ],
  ),
];

