import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:signlearn/config.dart';
import 'package:http/http.dart' as http;

class DictionaryWordPage extends StatefulWidget {
  final String id, title, description, category, categoryName;
  const DictionaryWordPage({Key? key, required this.id, required this.title, required this.description, required this.category, required this.categoryName}) : super(key: key);
  

  @override
  State<DictionaryWordPage> createState() => _DictionaryWordPageState();
}

class _DictionaryWordPageState extends State<DictionaryWordPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF1F4F8),
        appBar: AppBar(
          backgroundColor: const Color(0xFFACD783),
          automaticallyImplyLeading: true,
          title: Text(widget.title.toString(),
            style: const TextStyle(fontSize: 20, fontFamily: 'Raleway', height:1.5,fontWeight: FontWeight.bold, color: Colors.white)
          ),
          actions: const [],
          centerTitle: true,
          elevation: 5,
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: Config.server + "/signlearn/assets/c" + widget.category.toString() + "/" + widget.id.toString() + '.png',
                      width: 423,
                      height: 295.4,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: 456.4,
                  height: 261.6,
                  decoration: BoxDecoration(
                    color: const Color(0xFFC6DEAE),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 8,
                              child: Align(
                                alignment: const AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 10),
                                  child: Text(
                                    widget.title.toString(),
                                    style: 
                            const TextStyle(fontSize: 25, fontFamily: 'Raleway', height:1.5,fontWeight: FontWeight.bold)
                          ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {addToFavourite(widget.id.toString());}, 
                              icon: const Icon(
                              Icons.favorite_border_rounded,
                              color: Colors.black,
                              size: 30,
                            ),),
                            
                          ],
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(20, 0, 10, 10),
                          child: Text(
                            'Category : ${widget.categoryName}',
                            textAlign: TextAlign.start,
                            style: const TextStyle(fontSize: 20, height: 1.2)
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(20, 0, 10, 10),
                          child: Text(
                            widget.description.toString(),
                            textAlign: TextAlign.start,
                            style: const TextStyle(fontSize: 20, height: 1.2)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  void addToFavourite(String wordId) {
    http.post(
      Uri.parse("${Config.server}/signlearn/php/add_to_favourite.php"),
      body: {
        "word_id" : widget.id.toString(),
        "word_title" : widget.title.toString(),
        "word_description" : widget.description.toString(),
        "category_id" : widget.category.toString(),
        "category_title" : widget.categoryName.toString()
      }
    ).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        return http.Response(
          'Error', 408
        );
      }
    ).then((response) {
      var jsondata = jsonDecode(response.body);
      if (response.statusCode == 200 && jsondata['status'] == 'success') {
        setState(() {});
      }
    });
  }
}
