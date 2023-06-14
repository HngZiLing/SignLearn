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
    image: "${Config.server}/signlearn/assets/c3/quiz/1.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Hello', isCorrect: true),
      const Option(text: 'Please', isCorrect: false),
      const Option(text: 'Sorry', isCorrect: false),
      const Option(text: 'Thank you', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c3/quiz/2.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Goodbye', isCorrect: false),
      const Option(text: 'No', isCorrect: false),
      const Option(text: 'Yes', isCorrect: true),
      const Option(text: 'Welcome', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c3/quiz/3.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Please', isCorrect: false),
      const Option(text: 'Hello', isCorrect: false),
      const Option(text: 'Thank you', isCorrect: false),
      const Option(text: 'Sorry', isCorrect: true),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c3/quiz/4.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Eye', isCorrect: false),
      const Option(text: 'Ear', isCorrect: true),
      const Option(text: 'Mouth', isCorrect: false),
      const Option(text: 'Nose', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c3/quiz/5.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Money', isCorrect: true),
      const Option(text: 'wallet', isCorrect: false),
      const Option(text: 'Cashier', isCorrect: false),
      const Option(text: 'Card', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c3/quiz/6.png",
    text:
        "What is the expression of the above numbers?",
    options: [
      const Option(text: 'Send', isCorrect: false),
      const Option(text: 'Buy', isCorrect: false),
      const Option(text: 'Pay', isCorrect: true),
      const Option(text: 'Sale', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c3/quiz/7.png",
    text:
        "What is the expression of the above numbers?",
    options: [
      const Option(text: 'Pirce', isCorrect: false),
      const Option(text: 'Cheap', isCorrect: false),
      const Option(text: 'Expensive', isCorrect: false),
      const Option(text: 'Discount', isCorrect: true),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c3/quiz/8.png",
    text:
        "What is the expression of the above numbers?",
    options: [
      const Option(text: 'Cash', isCorrect: false),
      const Option(text: 'Bag', isCorrect: false),
      const Option(text: 'Wallet', isCorrect: true),
      const Option(text: 'Coin', isCorrect: false),
    ],
  ),
];
