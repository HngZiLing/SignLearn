import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:signlearn/config.dart';
import 'package:http/http.dart' as http;
import 'package:signlearn/page/category_detail_page.dart';
import '../model/category.dart';
import 'package:signlearn/page/dictionary_page.dart';
import 'package:signlearn/page/Favourite_page.dart';
import 'package:signlearn/model/dictionary.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState()=> _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  List<Category> categoryList = <Category>[];
  List wordList = [];
  String titlecenter = "Loading category";
  String search = "";
  int index = 0;
  String name = "";
  List <Dictionary> dictionaryList = <Dictionary>[];
  List<String> dictionaryTitle= [];
  late List pages = [];

  @override
  void initState() {
    super.initState();
    loadCategory();
    pages = [
      const CategoryPage(),
      DictionaryPage(
        onClickedItem: (item) {},
        items: dictionaryTitle
      ),
      const FavouritePage()
    ]; 
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('SignLearn'),
        centerTitle: true,
        backgroundColor: const Color(0xFFACD783),
      ),
      bottomNavigationBar: NavigationBar(
        height: 60,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() =>this.index = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.view_list_outlined),
            selectedIcon: Icon(Icons.view_list), 
            label: 'Category'
          ),
          NavigationDestination(
            icon: Icon(Icons.search_rounded),
            selectedIcon: Icon(Icons.search_outlined), 
            label: 'Dictionary'
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            selectedIcon: Icon(Icons.favorite), 
            label: 'Save'
          ),
        ],
      ),
      // body: pages[index];
      body: categoryList.isEmpty ? 
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(titlecenter,
            style: const TextStyle(fontSize: 14, fontFamily: 'Raleway', height:1.5,fontWeight: FontWeight.bold),
          ),
        ),
      ) :
      SafeArea(
        child: 
          Column(
            // mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                // width: 405.4,
                // height: 732.3,
                decoration: const BoxDecoration(
                  color: Color(0xFFE6EBE0),
                ),
                child: ListView(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                  scrollDirection: Axis.vertical,
                  children: List.generate(categoryList.length, (index) {
                    return SingleChildScrollView(
                      child : InkWell(
                        onTap : ()=> {
                          search = categoryList[index].categoryId.toString(),
                          Navigator.push(context, MaterialPageRoute( 
                            builder: (content) => CategoryDetailsPage(categoryTitle: categoryList[index].categoryTitle.toString(), categoryId : search)
                            ))
                          },
                        child : Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                      child: Container(
                        width: 100,
                        height: 123.7,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: Config.server + "/signlearn/assets/category/C" + categoryList[index].categoryId.toString() + ".jpg",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                      child: 
                                      Text(categoryList[index].categoryTitle.toString(),
                                        textAlign: TextAlign.start,
                                        style : const TextStyle(
                                          fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                        )
                                      ),
                                    ),
                                    Container(
                                      width: 400,
                                      decoration: const BoxDecoration(),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0,0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                        child:
                                          Text(categoryList[index].categoryDescription.toString(),
                                          maxLines: 2,
                                          style: const TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.normal,
                                          ),
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
                    
                    )
                     
                    );
                   
                  },
                  
                  ),
                  
                ),
              ),
              ),
              
            ],
          )
      ),
    );
  }

  void loadDictionary(){
  http.post(
   Uri.parse("${Config.server}/signlearn/php/load_dictionary.php")
  ).then((response) {
      var jsondata = jsonDecode(response.body);
      if (response.statusCode == 200 && jsondata['status'] == 'success') {
        var extractdata = jsondata['data'];
        if (extractdata['dictionary'] != null) {
            dictionaryList = <Dictionary>[];
            extractdata['dictionary'].forEach((v) {
            dictionaryList.add(Dictionary.fromJson(v));
            name = Dictionary.fromJson(v).wordTitle.toString();
            dictionaryTitle.add(name);
          });
          setState(() { });
        }
      } 
    }).timeout(
    const Duration(seconds: 60), 
    onTimeout:(){
      return;
    },
    );
  }

  void loadCategory () {
    http.post(
      Uri.parse(Config.server + "/signlearn/php/load_category.php"),
    ).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        return http.Response('Error', 408); // Request Timeout response status code
      },
    ).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        titlecenter = "Timeout Please retry again later";
        return http.Response('Error', 408); // Request Timeout response status code
      },
    ).then((response) {
      String jsonDataString = response.body.toString();
      var jsondata = jsonDecode(jsonDataString);
      // var jsondata = jsonDecode(response.body);
      if (response.statusCode == 200 && jsondata['status'] == 'success') {
        var extractdata = jsondata['data'];
        if (extractdata['category'] != null) {
          categoryList = <Category>[];
          extractdata['category'].forEach((v) {
            categoryList.add(Category.fromJson(v)); 
          });
          setState(() {});
        }
      } else {
        titlecenter = "Category is Empty 😞 ";
        setState(() {});
      }
    });
  }
}