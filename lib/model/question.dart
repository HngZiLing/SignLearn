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
  Question(
    image: "${Config.server}/signlearn/assets/c1/1.png",
    text: "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Y', isCorrect: false),
      const Option(text: 'A', isCorrect: true),
      const Option(text: 'E', isCorrect: false),
      const Option(text: 'z', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c1/8.png",
    text: "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'H', isCorrect: true),
      const Option(text: 'X', isCorrect: false),
      const Option(text: 'W', isCorrect: false),
      const Option(text: 'F', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c1/26.png",
    text: "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Z', isCorrect: true),
      const Option(text: 'D', isCorrect: false),
      const Option(text: 'G', isCorrect: false),
      const Option(text: 'K', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c1/16.png",
    text: "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'T', isCorrect: false),
      const Option(text: 'J', isCorrect: false),
      const Option(text: 'Q', isCorrect: false),
      const Option(text: 'P', isCorrect: true),
    ],
  ),

  Question(
    image: "${Config.server}/signlearn/assets/c1/quiz/1.png",
    text: "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Just', isCorrect: false),
      const Option(text: 'Gift', isCorrect: false),
      const Option(text: 'Only', isCorrect: true),
      const Option(text: 'Blue', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c1/quiz/2.png",
    text: "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'One', isCorrect: true),
      const Option(text: 'Two', isCorrect: false),
      const Option(text: 'Six', isCorrect: false),
      const Option(text: 'Ten', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c1/quiz/3.png",
    text: "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Hot', isCorrect: true),
      const Option(text: 'Air', isCorrect: false),
      const Option(text: 'Way', isCorrect: true),
      const Option(text: 'Fan', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c1/quiz/4.png",
    text: "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Up', isCorrect: false),
      const Option(text: 'To', isCorrect: true),
      const Option(text: 'Go', isCorrect: false),
      const Option(text: 'Or', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c1/quiz/5.png",
    text: "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Purple', isCorrect: false),
      const Option(text: 'Circle', isCorrect: false),
      const Option(text: 'Family', isCorrect: false),
      const Option(text: 'Friend', isCorrect: true),
    ],
  )  
];