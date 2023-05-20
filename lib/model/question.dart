class Question{
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;

  Question({
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
    text: "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'One', isCorrect: false),
      const Option(text: 'Two', isCorrect: false),
      const Option(text: 'Three', isCorrect: true),
      const Option(text: 'Four', isCorrect: false),
    ],
  ),
  Question(
    text: "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Four', isCorrect: false),
      const Option(text: 'Five', isCorrect: false),
      const Option(text: 'Six', isCorrect: true),
      const Option(text: 'Seven', isCorrect: false),
    ],
  ),
  Question(
    text: "Which of the following describes the sign language in the above image?",
    options: [
      const Option(text: 'Seven', isCorrect: false),
      const Option(text: 'Eight', isCorrect: false),
      const Option(text: 'Nine', isCorrect: true),
      const Option(text: 'Ten', isCorrect: false),
    ],
  ),
];