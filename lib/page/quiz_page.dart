import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:signlearn/model/question.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config.dart';
import '../main.dart';
import '../model/quiz.dart';

class QuizPage extends StatefulWidget {
  final String categoryTitle, categoryId;
  const QuizPage(
    {Key? key, required this.categoryTitle, required this.categoryId}
  ) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionNumber = 1;
  late PageController pageController;
  int score = 0;
  bool isLocked = false;
  List<Quiz> quizList = <Quiz>[];
  String titlecenter = "Loading quiz...";
  List<String> optionList = [];

  @override
  void initState() {
    super.initState();
    loadQuiz(widget.categoryId.toString());
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: const Color(0xFFACD783),
        automaticallyImplyLeading: true,
        title: Text(widget.categoryTitle.toString(),
          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'Raleway',
            height: 1.5,
            fontWeight: FontWeight.bold
          )
        ),
        actions: const [],
        centerTitle: true,
        elevation: 5,
      ),
      body: quizList.isEmpty
      ? Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(titlecenter,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'Raleway',
              height: 1.5,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ) 
      : Padding(
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
            ),
            Text(
                'Question $questionNumber/${quizList.length}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Raleway',
                  height: 1.5,
                ),
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
                borderRadius: BorderRadius.circular(25)),
                child: PageView.builder(
                  // itemCount: 1,
                  itemCount: quizList.length,
                  controller: pageController,
                  itemBuilder: (context, index) {
                    // List.generate(quizList.length, (index) {
                      optionList.add(quizList[index].optionA.toString());
                      optionList.add(quizList[index].optionB.toString());
                      optionList.add(quizList[index].optionC.toString());
                      optionList.add(quizList[index].correct.toString());
                      optionList.shuffle();
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 3,
                            child: CachedNetworkImage(
                              imageUrl: quizList[index].image.toString()
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            flex: 1,
                            child: Text(
                              quizList[index].text.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'Raleway', 
                                height: 1.3
                              ),
                            textAlign: TextAlign.justify,
                          )
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          flex: 5,
                          child: OptionWidget(
                            quiz : quizList[index],
                            onClickedOption: (option) {
                              if (quizList[index].isLocked) {
                                return;
                              } else {
                                setState(() {
                                  quizList[index].isLocked = true;
                                  quizList[index].selectedOption = option;
                                });
                                isLocked = quizList[index].isLocked = true;
                                if (quizList[index].selectedOption!.isCorrect) {
                                  score++;
                                  }
                                }
                              }
                            )
                          ),
                        const SizedBox(height: 10),
                      ],
                  //   );
                  // }
                  );
                  },
                )
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: isLocked ? buildElevatedButton() : const SizedBox.shrink(),
            ),
            const SizedBox(height: 10),
            
          ]
        )
      ),
    );

  }

  // Column buildQuestion(Quiz quiz) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       Expanded(
  //         flex: 3,
  //         child: CachedNetworkImage(
  //           imageUrl: quiz.image.toString(),
  //         ),
  //       ),
  //       const SizedBox(height: 8),
  //       Expanded(
  //         flex: 1,
  //         child: Text(
  //           quiz.text.toString(),
  //           style: const TextStyle(
  //             fontSize: 18,
  //             fontFamily: 'Raleway', 
  //             height: 1.3
  //           ),
  //           textAlign: TextAlign.justify,
  //         )
  //       ),
  //       const SizedBox(height: 10),
  //       Expanded(
  //         flex: 5,
  //         child: OptionWidget(
  //           quiz : quiz,
  //           onClickedOption: (option) {
  //             if (quiz.isLocked) {
  //               return;
  //             } else {
  //               setState(() {
  //                 quiz.isLocked = true;
  //               });
  //               if (quiz.selectedOption!.isCorrect) {
  //                 score++;
  //               }
  //             }
  //           }
  //           // optionList : optionList;
  //         )
  //       ),
  //       const SizedBox(height: 10),
  //     ],
  //   );
  // }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
      onPressed: () {
        if (questionNumber < quizList.length) {
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
              builder: (context) => ResultPage(score: score, questionNum: quizList.length,),
            )
          );
        }
      },
      child: Text(questionNumber < quizList.length ? 'Next' : 'See the Result')
    );
  }

  void loadQuiz(String search) {
    http.post(Uri.parse(Config.server + "/signlearn/php/load_quiz.php"),
      body: {'search': search}).then((response) {
      var jsondata = jsonDecode(response.body);
      if (response.statusCode == 200 && jsondata['status'] == 'success') {
        var extractdata = jsondata['data'];
        if (extractdata['quiz'] != null) {
          quizList = <Quiz>[];
          extractdata['quiz'].forEach((v) {
            quizList.add(Quiz.fromJson(v));
          });
          setState(() {});
        }
      }
    }).timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        return;
      },
    );
  }
}

class OptionWidget extends StatelessWidget {
  final Quiz quiz;
    final ValueChanged<QuizOption> onClickedOption;
  List<String> optionList = [];

  OptionWidget({
    Key? key,
    required this.quiz,
    required this.onClickedOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
    ),
  );

  Widget buildOption(BuildContext context, QuizOption option) {
    final color = getColorForOption(option, quiz);
    return GestureDetector(
      onTap: () => onClickedOption(option),
      child: Container(
        height: 40,
        padding: const EdgeInsets.fromLTRB(15, 3, 3, 3),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color),
          color: Colors.grey.shade200,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(option.text,
              style: const TextStyle(fontSize: 18),
            ),
            getIconForOption(option, quiz)
          ],
        ),
      )
    );
  }

  Color getColorForOption(QuizOption option, Quiz quiz) {
    final isSelected = option == quiz.selectedOption;
    if (quiz.isLocked) {
      if (isSelected) {
        return option.isCorrect ? Colors.green : Colors.red;
      } else if (option.isCorrect) {
        return Colors.green;
      }
    }
    return Colors.grey.shade300;
  }

  Widget getIconForOption(QuizOption option, Quiz quiz) {
    final isSelected = option == quiz.selectedOption;
    if (quiz.isLocked) {
      if (isSelected) {
        return option.isCorrect
            ? const Icon(Icons.check_circle, color: Colors.green)
            : const Icon(Icons.cancel, color: Colors.red);
      } else if (option.isCorrect) {
        return const Icon(Icons.check_circle, color: Colors.green);
      }
    }
    return const SizedBox.shrink();
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, required this.score, required this.questionNum}) : super(key: key);
  final int score;
  final int questionNum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFACD783),
                Color.fromARGB(255, 173, 218, 255),
              ],
            )
          ),
          child: Container(
            height: 300,
            width: 300,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white, 
              borderRadius: BorderRadius.circular(25)
            ),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Text('You get $score/$questionNum',
                    style: const TextStyle(
                      fontSize: 25,
                      fontFamily: 'Raleway',
                      height: 1.5,
                    )
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,MaterialPageRoute(
                          builder: (context) => const MainPage(),
                        ),
                      );
                    },
                    child: const Text("Got it",
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Raleway',
                        height: 1.5,
                      )
                    ),
                  )
                ]
              )
            ),
          )
        ),
      ),
    );
  }
}