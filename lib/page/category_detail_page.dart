import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:signlearn/model/word.dart';
import '../config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class CategoryDetailsPage extends StatefulWidget {
  final String category_id;
  final String category_title;
  const CategoryDetailsPage({Key? key, required this.category_title, required this.category_id}) : super(key: key);

  @override
  State<CategoryDetailsPage> createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
@override
  void initState() {
    super.initState();
    loadWord(widget.category_id.toString());
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
  String titlecenter = "Loading word...";

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= 600) { 
      resWidth = screenWidth/4;} 
    else { resWidth = screenWidth /3; }

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFE6EBE0),
        appBar: AppBar(
          backgroundColor: const Color(0xFFACD783),
          automaticallyImplyLeading: true,
          title: Text(widget.category_title.toString(),
            style: TextStyle(fontSize: 20, fontFamily: 'Raleway', height:1.5,fontWeight: FontWeight.bold)
          ),
          actions: [],
          centerTitle: true,
          elevation: 5,
        ),
        body: wordList.isEmpty ? 
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(titlecenter,
            style: const TextStyle(fontSize: 14, fontFamily: 'Raleway', height:1.5,fontWeight: FontWeight.bold),
          ),
        ),
      ) :
      SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 2,
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 5, 0, 0),
                                child: Text(
                                  'Quiz',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontSize: 20, fontFamily: 'Raleway', height:1.5,fontWeight: FontWeight.bold)
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(15, 5, 5, 5),
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(20, 5, 0, 0),
                                child: Text(
                                  'Video',
                                  style: TextStyle(fontSize: 20, fontFamily: 'Raleway', height:1.5,fontWeight: FontWeight.bold)
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Padding(
                              padding:
                                  const EdgeInsetsDirectional.fromSTEB(5, 0, 15, 5),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Expanded(
                    flex: 3,
                    child: Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0),
                        child: Text(
                          'Word List',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 20, fontFamily: 'Raleway', height:1.5,fontWeight: FontWeight.bold)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 15, 15),
                  child:  GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                    children: List.generate(wordList.length, (index) {
                      return InkWell(
                        splashColor: Colors.blue,
                        onTap: () => {loadWord(widget.category_id.toString())},
                        child: Card(
                    color: const Color.fromARGB(255, 214, 231, 245),
                    shadowColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              flex: 9, 
                              child: CachedNetworkImage(
                                imageUrl: Config.server + "/signlearn/assets/c" + widget.category_id.toString() + "/" + wordList[index].wordId.toString() + '.png',
                                fit: BoxFit.cover,
                                width: resWidth -5,
                                height: 50,
                                alignment: Alignment.center,
                                placeholder: (context, url) => const CircularProgressIndicator(),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                              ),
                            ),
                          ]
                        ),
                        ListTile(
                          title: Text(
                            wordList[index].wordTitle.toString(), textAlign: TextAlign.center, 
                            style: const TextStyle(fontSize: 20, fontFamily: 'Changa', color: Colors.indigo, height: 1.2)
                          ),
                        )
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

  void loadWord(String search){
  http.post(
   Uri.parse(Config.server + "/signlearn/php/load_word.php"),
   body: {
    'search' : search
    }).then((response) {
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
    }).timeout(
    const Duration(seconds: 60), 
    onTimeout:(){
      return;
    },
    );
  }
}