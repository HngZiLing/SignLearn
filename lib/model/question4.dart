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
    image: "${Config.server}/signlearn/assets/c4/quiz/1.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Excited', isCorrect: false),
      const Option(text: 'Happy', isCorrect: true),
      const Option(text: 'Love', isCorrect: false),
      const Option(text: 'Hope', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c4/quiz/2.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Sad', isCorrect: true),
      const Option(text: 'Mad', isCorrect: false),
      const Option(text: 'Worry', isCorrect: false),
      const Option(text: 'Hurt', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c4/quiz/3.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Annoyed', isCorrect: true),
      const Option(text: 'Doubt', isCorrect: false),
      const Option(text: 'Frightened', isCorrect: false),
      const Option(text: 'Bored', isCorrect: false),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c4/quiz/4.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Shy', isCorrect: false),
      const Option(text: 'Suprised', isCorrect: false),
      const Option(text: 'Scared', isCorrect: false),
      const Option(text: 'Love', isCorrect: true),
    ],
  ),
  Question(
    image: "${Config.server}/signlearn/assets/c4/quiz/5.png",
    text:
        "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Frustrated', isCorrect: false),
      const Option(text: 'Envy', isCorrect: false),
      const Option(text: 'Digust', isCorrect: true),
      const Option(text: 'Embarrassed', isCorrect: false),
    ],
  ),
];
