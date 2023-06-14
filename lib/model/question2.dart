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
    image: "${Config.server}/signlearn/assets/c2/quiz/1.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: '3', isCorrect: true),
      const Option(text: '6', isCorrect: false),
      const Option(text: '8', isCorrect: false),
      const Option(text: '9', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c2/quiz/2.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: '3', isCorrect: false),
      const Option(text: '4', isCorrect: false),
      const Option(text: '7', isCorrect: true),
      const Option(text: '8', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c2/quiz/3.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: '1', isCorrect: false),
      const Option(text: '6', isCorrect: false),
      const Option(text: '9', isCorrect: false),
      const Option(text: '10', isCorrect: true),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c2/quiz/4.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: '5', isCorrect: false),
      const Option(text: '6', isCorrect: false),
      const Option(text: '7', isCorrect: false),
      const Option(text: '8', isCorrect: true),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c2/quiz/5.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: '0', isCorrect: false),
      const Option(text: '9', isCorrect: true),
      const Option(text: '3', isCorrect: false),
      const Option(text: '6', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c2/quiz/6.png",
    text:
        "What is the expression of the above numbers?",
    options: [
      const Option(text: '1 + 3', isCorrect: true),
      const Option(text: '1 + 6', isCorrect: false),
      const Option(text: '1 + 8', isCorrect: false),
      const Option(text: '1 + 9', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c2/quiz/7.png",
    text:
        "What is the expression of the above numbers?",
    options: [
      const Option(text: '1 + 10', isCorrect: false),
      const Option(text: '6 + 5', isCorrect: false),
      const Option(text: '6 + 10', isCorrect: false),
      const Option(text: '10 + 5', isCorrect: true),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c2/quiz/8.png",
    text:
        "What is the expression of the above numbers?",
    options: [
      const Option(text: '4 + 1', isCorrect: false),
      const Option(text: '7 + 2', isCorrect: false),
      const Option(text: '4 + 2', isCorrect: true),
      const Option(text: '7 + 1', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c2/quiz/9.png",
    text:
        "What is the expression of the above numbers?",
    options: [
      const Option(text: '6 + 7', isCorrect: false),
      const Option(text: '8 + 7', isCorrect: true),
      const Option(text: '7 + 8', isCorrect: false),
      const Option(text: '4 + 8', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c2/quiz/10.png",
    text:
        "What is the expression of the above numbers?",
    options: [
      const Option(text: '6 + 9', isCorrect: true),
      const Option(text: '3 + 9', isCorrect: false),
      const Option(text: '3 + 6', isCorrect: false),
      const Option(text: '9 + 6', isCorrect: false),
    ],
  ),
];
