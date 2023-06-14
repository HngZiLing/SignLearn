class Quiz {
  String? questionId;
  String? image;
  String? text;
  String? optionA;
  String? optionB;
  String? optionC;
  String? correct;
  String? category;
  late bool isLocked = false;
  QuizOption? selectedOption;
  late List<String?> options;

  Quiz({
    this.questionId,
    this.image,
    this.text,
    this.optionA,
    this.optionB,
    this.optionC,
    this.correct,
    this.category,
    this.isLocked = false,
    this.selectedOption,
    this.options = const [],
  });

    Quiz.fromJson(Map<String, dynamic> json) {
    questionId = json['question_id'];
    text = json['question'];
    image = json['question_image'];
    optionA = json['option_a'];
    optionB = json['option_b'];
    optionC = json['option_c'];
    correct = json['correct_option'];
    category = json['category_id'];
    options = [optionA, optionB, optionC, correct];
  }
}

class QuizOption {
  final String text;
  final bool isCorrect;

  const QuizOption({
    required this.text,
    required this.isCorrect,
  });
}