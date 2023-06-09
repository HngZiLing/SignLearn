class Quiz {
  String? questionId;
  String? image;
  String? text;
  String? optionA;
  String? optionB;
  String? optionC;
  String? correct;
  String? category;
  late bool isLocked;
  QuizOption? selectedOption;

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
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['category_id'] = categoryId;
  //   data['category_title'] = categoryTitle;
  //   data['category_description'] = categoryDescription;
  //   return data;
  // }
}

class QuizOption {
  // final String questionId;
  final String text;
  final bool isCorrect;

  const QuizOption({
    // required this.questionId,
    required this.text,
    required this.isCorrect,
  });
}

// final questions = [
//   Quiz(
//     questionId: ,
//     image: "${Config.server}/signlearn/assets/c1/13.png",
//     text:
//         "Which of the following describes the sign language in the above image?",
//     options: [
//       const Option(text: 'N', isCorrect: false),
//       const Option(text: 'B', isCorrect: false),
//       const Option(text: 'M', isCorrect: true),
//       const Option(text: 'C', isCorrect: false),
//     ],
//   ),
// ];