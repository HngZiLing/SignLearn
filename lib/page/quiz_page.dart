// import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:signlearn/model/question.dart';

// class QuizPage extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Material App Bar'),
//         ),
//         body: QuestionWidget(),
//         ),
//     );
//   }
// }

// class QuestionWidget extends StatefulWidget {
//   const QuestionWidget({
//     Key? key,
//   }) : super(key: key);

//   @Override
//   State<QuestionWidget> createState() => QuestionWidgetState();
// }

// class QuestionWidgetState extends State<QuestionWidget>{
//   int questionNumber = 1;

//   @override
//   Widget build(BuildContext context){
//     return Padding (
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           const SizedBox(height: 32),
//           Text('Question $questionNumber/${questions.length}'),
//           const Divider(thickness: 1, color: Colors.grey),
//           Expanded(
//             child: PageView.builder(
//               itemCount: questions.length,
//               physics: const NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) {
//                 final question = questions[index];
//                 return buildQuestion(question);

//               },
//             ))
//             const SizedBox(height: 20)
//         ],
//       ));
//   }
  
  

//   Column buildQuestion(Question question) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 32),
//         Text(question.text,
//         style: const TextStyle(fontSize: 25)),
//         const SizedBox(height: 32),
//         Expanded(
//           child: OptionWidget(
//             question: question))
//       ],
//     );
//   }
// }

// class OptionWidget extends StatelessWidget {
//     final Question question;
//     const OptionWidget({
//       Key? key,
//       required this.question,
//     }) : super (key:key);

//     @override
//     Widget build(BuildContext context) => SingleChildScrollView(
//       child: Column(
//         children: question.options.map((e) => buildOption(context, option)).toList()
//       )
//     );
//   }