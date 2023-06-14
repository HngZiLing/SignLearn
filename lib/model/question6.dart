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
    image: "${Config.server}/signlearn/assets/c6/quiz/1.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Banana', isCorrect: true),
      const Option(text: 'Pineapple', isCorrect: false),
      const Option(text: 'Apple', isCorrect: false),
      const Option(text: 'Orange', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c6/quiz/2.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Milk', isCorrect: true),
      const Option(text: 'Juice', isCorrect: false),
      const Option(text: 'Tea', isCorrect: false),
      const Option(text: 'Coffee', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c6/quiz/3.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Candy', isCorrect: false),
      const Option(text: 'Cookie', isCorrect: false),
      const Option(text: 'Donut', isCorrect: true),
      const Option(text: 'Sandwich', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c6/quiz/4.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Spaghetti', isCorrect: false),
      const Option(text: 'French fries', isCorrect: false),
      const Option(text: 'Hotdog', isCorrect: false),
      const Option(text: 'Burger', isCorrect: true),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c6/quiz/5.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Pizza', isCorrect: false),
      const Option(text: 'Ice cream', isCorrect: true),
      const Option(text: 'Popcorn', isCorrect: false),
      const Option(text: 'Cupcake', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c6/quiz/6.png",
    text:
        "What is the expression of the above numbers?",
    options: [
      const Option(text: 'Melon', isCorrect: true),
      const Option(text: 'Peach', isCorrect: false),
      const Option(text: 'Grape', isCorrect: false),
      const Option(text: 'Pear', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c6/quiz/7.png",
    text:
        "What is the expression of the above numbers?",
    options: [
      const Option(text: 'Cereal', isCorrect: false),
      const Option(text: 'Coffee', isCorrect: true),
      const Option(text: 'Steak', isCorrect: false),
      const Option(text: 'Soup', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c6/quiz/8.png",
    text:
        "What is the expression of the above numbers?",
    options: [
      const Option(text: 'Pizza', isCorrect: true),
      const Option(text: 'Chocolate', isCorrect: false),
      const Option(text: 'Burger', isCorrect: false),
      const Option(text: 'Donut', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c6/quiz/9.png",
    text:
        "What is the expression of the above numbers?",
    options: [
      const Option(text: 'Tap water', isCorrect: false),
      const Option(text: 'Soda pop', isCorrect: false),
      const Option(text: 'Juice', isCorrect: false),
      const Option(text: 'Soup', isCorrect: true),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c6/quiz/10.png",
    text:
        "What is the expression of the above numbers?",
    options: [
      const Option(text: 'Ice cream', isCorrect: false),
      const Option(text: 'Cookie', isCorrect: false),
      const Option(text: 'Tea', isCorrect: true),
      const Option(text: 'Milk6', isCorrect: false),
    ],
  ),
];
