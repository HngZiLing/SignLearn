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
    image: "${Config.server}/signlearn/assets/c7/quiz/1.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Duck', isCorrect: false),
      const Option(text: 'Rat', isCorrect: false),
      const Option(text: 'Cat', isCorrect: true),
      const Option(text: 'Cow', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c7/quiz/2.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Cow', isCorrect: true),
      const Option(text: 'Owl', isCorrect: false),
      const Option(text: 'Bat', isCorrect: false),
      const Option(text: 'Bird', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c7/quiz/3.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Cat', isCorrect: false),
      const Option(text: 'Duck', isCorrect: false),
      const Option(text: 'Pig', isCorrect: false),
      const Option(text: 'Bird', isCorrect: true),
    ],
  ),
];
