import 'package:flutter/material.dart';
import 'package:signlearn/model/question.dart';

class QuizPage extends StatefulWidget {
  final String categoryTitle, categoryId;
  const QuizPage({Key? key, required this.categoryTitle, required this.categoryId}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>{
  int questionNumber = 1;
  late PageController pageController;
  int score = 0;
  bool isLocked = false;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:  Padding (
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 32),
          Text('Question $questionNumber/${questions.length}'),
          const Divider(thickness: 1, color: Colors.grey),
          Expanded(
            child: PageView.builder(
              itemCount: questions.length,
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final question = questions[index];
                return buildQuestion(question);
              },
            )
            ),
            isLocked ? buildElevatedButton() : const SizedBox.shrink(),
            const SizedBox(height: 20)
        ],
      ))
    );
   
  }

  Column buildQuestion(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        Text(question.text,
        style: const TextStyle(fontSize: 25)),
        const SizedBox(height: 32),
        Expanded(
          child: OptionWidget(
            question: question,
            onClickedOption: (option) {
              if (question.isLocked) {
                return; 
              } else {
                setState(() {
                  question.isLocked = true;
                  question.selectedOption = option;
                });
                isLocked = question.isLocked;
                if (question.selectedOption!.isCorrect) {
                  score++;
                }
              }
            }))
      ],
    );
  }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
      onPressed: () {
        if (questionNumber < questions.length) {
          pageController.nextPage(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInExpo,
          );

          setState(() {
            questionNumber++;
            isLocked = false;
          });
        } else {
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(
              builder: (context) => ResultPage(score: score),
            )
          );
        }
      }, 
      child: Text(
        questionNumber < questions.length ? 'Next' : 'See the Result'));
  }
}

class OptionWidget extends StatelessWidget {
    final Question question;
    final ValueChanged<Option> onClickedOption;

    const OptionWidget({
      Key? key,
      required this.question,
      required this.onClickedOption,
    }) : super (key:key);
    
    @override
    Widget build(BuildContext context) => SingleChildScrollView(
      child: Column(
        children: question.options
        .map((option) => buildOption(context, option))
        .toList()
      ),
    );

    Widget buildOption(BuildContext context, Option option){
      final color = getColorForOption(option, question);
      return GestureDetector(
        onTap: () => onClickedOption(option),
        child: Container(
        height: 50,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical:8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color : color),
          color: Colors.grey.shade200,
        ),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            option.text,
            style: const TextStyle(fontSize: 20),
          ),
          getIconForOption(option, question)
        ],
      ),
      )
      );
    }

    Color getColorForOption(Option option, Question question) {
      final isSelected = option == question.selectedOption;
      if(question.isLocked) {
        if(isSelected) {
          return option.isCorrect ? Colors.green : Colors.red;
        } else if (option.isCorrect) {
          return Colors.green;
        }
      } return Colors.grey.shade300;
    }

    Widget getIconForOption(Option option, Question question) {
      final isSelected = option == question.selectedOption;
      if(question.isLocked) {
        if(isSelected) {
          return option.isCorrect 
          ? const Icon (Icons.check_circle, color: Colors.green)
          : const Icon (Icons.cancel, color: Colors.red); 
        } else if (option.isCorrect) {
          return const Icon(Icons.check_circle, color: Colors.green);
        }
      } return const SizedBox.shrink();
    }
  }

  class ResultPage extends StatelessWidget {
    const ResultPage({Key ? key, required this.score}) : super(key: key);
    final int score;

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: Text('You get $score/${questions.length}'),
        )
      );
    }
  }