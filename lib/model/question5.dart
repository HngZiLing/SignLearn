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
    image: "${Config.server}/signlearn/assets/c5/quiz/1.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Father', isCorrect: true),
      const Option(text: 'Son', isCorrect: false),
      const Option(text: 'Uncle', isCorrect: false),
      const Option(text: 'Brother', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c5/quiz/2.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Aunt', isCorrect: false),
      const Option(text: 'Daughter', isCorrect: false),
      const Option(text: 'Sister', isCorrect: true),
      const Option(text: 'Mother', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c5/quiz/3.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Daughter', isCorrect: false),
      const Option(text: 'Son', isCorrect: true),
      const Option(text: 'Uncle', isCorrect: false),
      const Option(text: 'Aunt', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c5/quiz/4.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Son', isCorrect: false),
      const Option(text: 'Father', isCorrect: false),
      const Option(text: 'Daughter', isCorrect: false),
      const Option(text: 'Mother', isCorrect: true),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c5/quiz/5.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Uncle', isCorrect: true),
      const Option(text: 'Brother', isCorrect: false),
      const Option(text: 'Mother', isCorrect: false),
      const Option(text: 'Son', isCorrect: false),
    ],
  ),
];
