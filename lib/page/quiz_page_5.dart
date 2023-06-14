import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:signlearn/model/question5.dart';

class QuizPage5 extends StatefulWidget {
  final String categoryTitle, categoryId;
  const QuizPage5({Key? key, required this.categoryTitle, required this.categoryId}) : super(key: key);
  @override
  State<QuizPage5> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage5>{
  int questionNumber = 1;
  late PageController pageController;
  int score = 0;
  bool isLocked = false;
  int index = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    // questions[index].isLocked=false; questions[index].selectedOption=null;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFFF1F4F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFACD783),
        automaticallyImplyLeading: true,
        title: Text(widget.categoryTitle.toString(),
          style: const TextStyle(fontSize: 20, fontFamily: 'Raleway', height:1.5, fontWeight: FontWeight.bold, color: Colors.white)
        ),
        leading: BackButton(
          color: Colors.white,
          onPressed: () => {
            Navigator.of(context).popUntil(ModalRoute.withName("/detail"))
            },
        ), 
        centerTitle: true,
        elevation: 5,
      ),

      body: Padding (
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: const Color(0xFFACD783),
                borderRadius: BorderRadius.circular(50),
                ),
                child:Text('Question $questionNumber/${questions.length}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Raleway', 
                  height: 1.5,
                ),
              )
            ),
            const SizedBox(height: 10),
            const Divider(thickness: 1, color: Colors.grey),
            const SizedBox(height: 10),
            Expanded(
              flex: 9,
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25)
                ),
                child: PageView.builder(
                  itemCount: questions.length,
                  controller: pageController,
                  itemBuilder: (context, index) {
                    final question = questions[index];
                    return buildQuestion(question);
                  },
                )
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: isLocked ? buildElevatedButton(questions[index]) : const SizedBox.shrink(),
            ),
            const SizedBox(height: 10)
          ],
        )
      ),
    );
  }
  
  Column buildQuestion(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: CachedNetworkImage(
            imageUrl: question.image,
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          flex: 1,
          child: Text(question.text,
          style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Raleway', 
              height: 1.3
            ), textAlign: TextAlign.justify,
          )
        ),
        const SizedBox(height: 10),
        Expanded(
          flex: 5,
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
            }
          )
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  ElevatedButton buildElevatedButton(Question question) {

    return ElevatedButton(
      onPressed: () {
        if (questionNumber < questions.length) {
          pageController.nextPage(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInExpo,
          );
          setState(() {
            questions[questionNumber-1].isLocked=false;
            questions[questionNumber-1].selectedOption=null;
            questionNumber++;
            isLocked = false;
          });
        } else {
          setState(() {
            questions[questionNumber-1].isLocked=false;
            questions[questionNumber-1].selectedOption=null;
          });

          showDialog(
            context: context, 
            barrierDismissible: false,
            builder: (context) => 
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25)
                ),
                child: AlertDialog(
                backgroundColor: Colors.amber,
                // backgroundColor: Color(0xFFACD783),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Your Score",
                      style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      CircleAvatar(
                        radius: 70,
                        backgroundColor: score == questions.length / 2
                        ? Colors.yellow
                        : score < questions.length / 2
                          ? Colors.red
                          : Colors.blue,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 7,
                                child: Center(
                                  child:Text(
                            "$score/${questions.length}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 30, color: Colors.white),
                            ),
                                )),
                                Expanded(
                                  flex: 3,
                                  child: Text(score == questions.length / 2 
                                              ? "Almost There"
                                              : score < questions.length / 2
                                              ? "Keep going"
                                              : "Great!",
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(color: Colors.white)),
                                )
                            ]
                          ),
                      ),
                      
                    ],
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                          ElevatedButton(
                            onPressed: () => Navigator.push(context, MaterialPageRoute(
                              builder: (content) => QuizPage5(categoryTitle: widget.categoryTitle.toString(), categoryId: widget.categoryId.toString()))),
                            child: const Text("Try Again", style: TextStyle(color: Colors.white))
                          ),
                          const SizedBox(width: 20),
                          ElevatedButton(
                            onPressed:() => Navigator.of(context).popUntil(ModalRoute.withName("/detail")),
                            child: const Text("Go Back", style: TextStyle(color: Colors.white))
                          ),
                         
                        ],
                      ),
                      const SizedBox(width: 50),
                ],
                )
              )
              ),
          );
        }
      }, 
      child: Text(
        questionNumber < questions.length ? 'Next' : 'See the Result'
      )
    );
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
    Widget build(BuildContext context) => 
    SingleChildScrollView(
      child: 
      Column(
        children: question.options
        .map((option) => buildOption(context, option))
        .toList()
      ),
    );

    Widget buildOption(BuildContext context, Option option){
      final color = getColorForOption(option, question);

      return GestureDetector(
        onTap:() => onClickedOption(option),
        child: Container(
           height: 40,
        padding: const EdgeInsets.fromLTRB(15, 3, 3, 3),
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
            style: const TextStyle(fontSize: 18),
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