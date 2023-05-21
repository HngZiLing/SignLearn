import 'package:cached_network_image/cached_network_image.dart';
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
      // body: Stack(
      //   children: [
      //     SafeArea(
      //       child: Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 20),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             const Spacer(flex:2),
      //             Text(
      //               "Let's Play Quiz",
      //               style: Theme.of(context).textTheme.headlineMedium?.copyWith(
      //                 color: Colors.blue, fontWeight: FontWeight.bold
      //               ),),
      //               const Spacer(),
      //               InkWell(
      //                 onTap: () {Navigator.push(context, MaterialPageRoute(builder: (content) => 
      //                 Scaffold(
                        body:  Padding (
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(height: 32),
                              Text('Question $questionNumber/${questions.length}'),
                              const Divider(thickness: 1, color: Colors.grey),
                              Expanded(
                                flex: 8,
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
                          )
                        )
                      );

                        // Scaffold(
                        //   body: Stack(
                        //     children: [
                        //       SafeArea(
                        //         child: Padding(
                        //           padding: const EdgeInsets.symmetric(horizontal: 50),
                        //           child: Column(
                        //             children: [
                        //               Container(
                        //                 width: double.infinity,
                        //                 height: 35,
                        //                 decoration: BoxDecoration(
                        //                   border: Border.all(color: Color(0xFF3F4768), width: 3),
                        //                   borderRadius: BorderRadius.circular(50),
                        //                 ),
                        //                 child: Stack(
                        //                   children: [
                        //                     LayoutBuilder(
                        //                       builder: (context, constraints) => Container(
                        //                         width: constraints.maxWidth * 0.5,
                        //                         decoration: BoxDecoration(
                        //                           gradient: const LinearGradient(
                        //                             colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
                        //                             begin: Alignment.centerLeft,
                        //                             end: Alignment.centerRight
                        //                           ),
                        //                           borderRadius: BorderRadius.circular(50),
                        //                         ),
                        //                       )
                        //                     ),
                        //                     Positioned.fill(
                        //                       child: Padding(
                        //                         padding: const EdgeInsets.symmetric(horizontal: 10),
                        //                         child: Row(
                        //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                           children: [
                        //                             Text("18 sec")
                        //                           ]
                        //                         ),
                        //                       )
                        //                     )
                        //                   ],
                        //                 )
                        //               )
                        //             ]
                        //           ),
                        //         )
                        //       )
                        //     ],
                        //   )
                        // )
      //                 )); },
      //                 child: Container(
      //                   width: double.infinity,
      //                   alignment: Alignment.center,
      //                   padding: const EdgeInsets.all(15),
      //                   decoration: const BoxDecoration(
      //                     gradient: LinearGradient(
      //                       colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
      //                       begin: Alignment.centerLeft,
      //                       end: Alignment.centerRight
      //                     ),
      //                     borderRadius: BorderRadius.all(Radius.circular(12)),
      //                   ),
      //                   child: Text(
      //                     "Lets Start Quiz",
      //                     style: Theme.of(context).textTheme.bodyMedium?.copyWith(
      //                       color: Colors.black
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               const Spacer(flex:2)
      //           ],
      //         ),
      //       )
      //     )
      //   ],
      // ),
    // );
   
  }

  Column buildQuestion(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: CachedNetworkImage(
            imageUrl: question.image,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(question.text, 
            style: const TextStyle(fontSize: 25)
          )
        ),
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
        )
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

  // class  extends StatelessWidget {
  //     @override
  //     Widget build(BuildContext context) { {
  //   }
  // }

// class QuizPage extends StatefulWidget {
//   final String categoryTitle, categoryId;
//   const QuizPage({Key? key, required this.categoryTitle, required this.categoryId}) : super(key: key);

//   @override
//   State<QuizPage> createState() => _QuizPageState();
// }

// class _QuizPageState extends State<QuizPage> {
//   // final scaffoldKey = GlobalKey<ScaffoldState>();
//   // final _unfocusNode = FocusNode();

//   @override
//   void initState() {
//     super.initState();
//     // _model = createModel(context, () => QuizPageModel());
//   }

//   @override
//   void dispose() {
//     // _model.dispose();

//     // _unfocusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       // onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
//       child: Scaffold(
//         // key: scaffoldKey,
//         // backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//         appBar: AppBar(
//           backgroundColor: Color(0xFFACD783),
//           automaticallyImplyLeading: true,
//           title: Text(
//             widget.categoryTitle,
//             style: const TextStyle(
//                   fontFamily: 'Montserrat',
//                   color: Colors.white,
//                   fontSize: 25,
//                 ),
//           ),
//           actions: [],
//           centerTitle: true,
//           elevation: 5,
//         ),
//         body: SafeArea(
//           top: true,
//           child: Column(
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
//                 child: Image.network(
//                   'https://media.baamboozle.com/uploads/images/190665/1608397480_137653',
//                   width: 404.2,
//                   height: 300,
//                   fit: BoxFit.fitHeight,
//                 ),
//               ),
//               Align(
//                 alignment: AlignmentDirectional(-1, 0),
//                 child: Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
//                   child: Text(
//                     'What is the ASL alphabet sign?',
//                     style: FlutterFlowTheme.of(context).bodyMedium.override(
//                           fontFamily: 'Poppins',
//                           fontSize: 20,
//                         ),
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: AlignmentDirectional(-1, 0),
//                 child: Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
//                   child: FlutterFlowRadioButton(
//                     options: ['M', 'N', 'A', 'E'].toList(),
//                     onChanged: (val) => setState(() {}),
//                     controller: _model.radioButtonValueController ??=
//                         FormFieldController<String>(null),
//                     optionHeight: 50,
//                     textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
//                           fontFamily: 'Poppins',
//                           color: Colors.black,
//                         ),
//                     buttonPosition: RadioButtonPosition.left,
//                     direction: Axis.vertical,
//                     radioButtonColor: Color(0xFFACD783),
//                     inactiveRadioButtonColor: Color(0xFF8E8E8E),
//                     toggleable: false,
//                     horizontalAlignment: WrapAlignment.start,
//                     verticalAlignment: WrapCrossAlignment.start,
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: AlignmentDirectional(0, 0),
//                 child: FFButtonWidget(
//                   onPressed: () {
//                     print('Button pressed ...');
//                   },
//                   text: 'Next',
//                   icon: Icon(
//                     Icons.arrow_right_alt,
//                     size: 30,
//                   ),
//                   options: FFButtonOptions(
//                     width: 130,
//                     height: 50,
//                     padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//                     iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
//                     color: Color(0xFFACD783),
//                     textStyle: FlutterFlowTheme.of(context).titleSmall.override(
//                           fontFamily: 'Poppins',
//                           color: Colors.white,
//                           fontSize: 20,
//                         ),
//                     elevation: 2,
//                     borderSide: BorderSide(
//                       color: Colors.transparent,
//                       width: 1,
//                     ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }