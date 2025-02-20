import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:signlearn/model/word.dart';
import 'package:signlearn/page/quiz_page_3.dart';
import 'package:signlearn/page/quiz_page_4.dart';
import 'package:signlearn/page/quiz_page_5.dart';
import 'package:signlearn/page/quiz_page_6.dart';
import 'package:signlearn/page/quiz_page_7.dart';
import 'package:signlearn/page/video_page.dart';
import '../config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:signlearn/page/category_word_page.dart';
import 'package:signlearn/page/quiz_page_1.dart';
import 'package:signlearn/page/quiz_page_2.dart';

class CategoryDetailsPage extends StatefulWidget {
  final String categoryId, categoryTitle;
  const CategoryDetailsPage(
    {Key? key, required this.categoryTitle, required this.categoryId})
    : super(key: key);

  @override
  State<CategoryDetailsPage> createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
  @override
  void initState() {
    super.initState();
    loadWord(widget.categoryId.toString());
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  List<Word> wordList = <Word>[];
  late double screenWidth = 0.0, resWidth = 0.0;
  String titlecenter = "";

  @override
  Widget build(BuildContext context) {
    

    screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 600) {
      resWidth = screenWidth / 4;
    } else {
      resWidth = screenWidth / 3;
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF1F4F8),
        appBar: AppBar(
          backgroundColor: const Color(0xFFACD783),
          automaticallyImplyLeading: true,
          title: Text(widget.categoryTitle.toString(),
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'Raleway',
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: Colors.white
            )
          ),
          leading: BackButton(
          color: Colors.white,
          onPressed: () => {
            Navigator.popUntil(context, (route) => route.isFirst),
            },
          ), 
          actions: const [],
          centerTitle: true,
          elevation: 5,
        ),
        body: wordList.isEmpty
        ? Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              titlecenter,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Raleway',
                height: 1.5,
                fontWeight: FontWeight.bold
            ),
          ),
        ))
        : SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Expanded(
                            flex: 3,
                            child: Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20, 5, 0, 0),
                                child: Text('Quiz', textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Raleway',
                                    height: 1.5,
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 5, 5),
                              child: InkWell(
                                onTap: () => {navigateQuiz(widget.categoryId)},
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    imageUrl: Config.server + "/signlearn/assets/quiz.jpg",
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Expanded(
                            flex: 3,
                            child: Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(20, 5, 0, 0),
                                child: Text('Video',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Raleway',
                                    height: 1.5,
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 15, 5),
                              child: InkWell(
                                onTap: () => {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (content) => VideoPage(
                                      categoryTitle: widget.categoryTitle.toString(),
                                      categoryId: widget.categoryId.toString()
                                    )
                                  )),
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    imageUrl: Config.server + "/signlearn/assets/video.jpg",
                                    width: 197.9,
                                    height: 185.4,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0),
                        child: Text('Word List', textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Raleway',
                            height: 1.5,
                            fontWeight: FontWeight.bold
                          )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 15),
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1,
                    children: List.generate(wordList.length, (index) {
                      return InkWell(
                        splashColor: const Color(0xFFE6EBE0),
                        onTap: () => {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (content) => CategoryWordPage(
                              id: wordList[index].wordId.toString(),
                              title: wordList[index].wordTitle.toString(),
                              description:  wordList[index].wordDescription.toString(),
                              category: widget.categoryId.toString()
                            )
                          ))
                        },
                        child: Card(
                          color: const Color(0xFFE6EBE0),
                          shadowColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 10),
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    imageUrl: Config.server + "/signlearn/assets/c" + widget.categoryId.toString() + "/" + wordList[index] .wordId.toString() + ".png",
                                    fit: BoxFit.cover,
                                    width: resWidth - 3,
                                    height: 100,
                                    alignment: Alignment.center,
                                    // placeholder: (context, url) => const CircularProgressIndicator(),
                                    // errorWidget: (context, url, error) => const Icon(Icons.error),
                                  ),
                                )
                              ),
                              Text(
                                wordList[index].wordTitle.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 15, height: 1.5)
                              ),
                             ],
                          )
                        )
                      );
                    })
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  navigateQuiz(String id) {
  switch (id) {
    case "1":
      {Navigator.push(context, MaterialPageRoute(
        builder: (content) => QuizPage1(
          categoryTitle: widget.categoryTitle.toString(),
          categoryId: widget.categoryId.toString()
          )
      ));}
      break;
    case "2":
      {Navigator.push(context, MaterialPageRoute(
        builder: (content) => QuizPage2(
          categoryTitle: widget.categoryTitle.toString(),
          categoryId: widget.categoryId.toString()
          )
      ));} 
      break;
    case "3":
      {Navigator.push(context, MaterialPageRoute(
        builder: (content) => QuizPage3(
          categoryTitle: widget.categoryTitle.toString(),
          categoryId: widget.categoryId.toString()
          )
      ));} 
      break;
    case "4":
      {Navigator.push(context, MaterialPageRoute(
        builder: (content) => QuizPage4(
          categoryTitle: widget.categoryTitle.toString(),
          categoryId: widget.categoryId.toString()
          )
      ));} 
      break;
    case "5":
      {Navigator.push(context, MaterialPageRoute(
        builder: (content) => QuizPage5(
          categoryTitle: widget.categoryTitle.toString(),
          categoryId: widget.categoryId.toString()
          )
      ));} 
      break;
    case "6":
      {Navigator.push(context, MaterialPageRoute(
        builder: (content) => QuizPage6(
          categoryTitle: widget.categoryTitle.toString(),
          categoryId: widget.categoryId.toString()
          )
      ));} 
      break;
    case "7":
      {Navigator.push(context, MaterialPageRoute(
        builder: (content) => QuizPage7(
          categoryTitle: widget.categoryTitle.toString(),
          categoryId: widget.categoryId.toString()
          )
      ));} 
      break;
  }
}

  void loadWord(String search) {
    http.post(Uri.parse(Config.server + "/signlearn/php/load_word.php"),
      body: {'search': search})
      .timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        titlecenter = "Timeout Please retry again later";
        return http.Response('Error', 408);
      },
    ).then((response) {
      var jsondata = jsonDecode(response.body);
      if (response.statusCode == 200 && jsondata['status'] == 'success') {
        var extractdata = jsondata['data'];
        if (extractdata['word'] != null) {
          wordList = <Word>[];
          extractdata['word'].forEach((v) {
            wordList.add(Word.fromJson(v));
          });
          setState(() {});
        }
      }
      else {
        titlecenter = "Sorry, there are no words at the moment, we will add words as soon as possible";
      }
    });
  }
}

class ExtractArgumentsScreen extends StatelessWidget {
  const ExtractArgumentsScreen({super.key});

  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CategoryDetailsPage;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.categoryTitle),
      ),
      body: Center(
        child: Text(args.categoryId),
      ),
    );
  }
}