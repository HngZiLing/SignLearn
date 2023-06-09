import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:signlearn/config.dart';
import 'package:http/http.dart' as http;
import 'package:signlearn/page/category_page.dart';
import 'package:signlearn/page/dictionary_page.dart';
import 'package:signlearn/page/Favourite_page.dart';
import 'package:signlearn/model/dictionary.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int index = 0;
  String name = "";
  List<Dictionary> dictionaryList = <Dictionary>[];
  List<String> dictionaryTitle = [];
  late List pages = [];

  @override
  void initState() {
    super.initState();
    loadDictionary();
    pages = [
      const CategoryPage(),
      DictionaryPage(onClickedItem: (item) {}, items: dictionaryTitle),
      const FavouritePage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('SignLearn'),
        centerTitle: true,
        backgroundColor: const Color(0xFFACD783),
        actions: [
          IconButton(
            icon: const Icon(Icons.lightbulb),
            tooltip: 'SignLearn Info',
            onPressed: () {
              Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InfoPage(),
            )
          );
          },
          ),
        ],
      ),
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        height: 60,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() => this.index = index),
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
    );
  }

  void loadDictionary() {
    http
        .post(Uri.parse("${Config.server}/signlearn/php/load_dictionary.php"))
        .then((response) {
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

class InfoPage extends StatelessWidget {
  InfoPage({Key? key}) : super(key: key);
  
  List<String> imageList = ["WikiHow", "BabySignLanguage", "WikiHow"];
  List<String> titleList = ["Wiki How", "Baby Sign Langauge", "B"];
  List<String> referenceList = ["Feeling", "Alphabet, Number", "C"];

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('SignLearn'),
        centerTitle: true,
        backgroundColor: const Color(0xFFACD783),
        automaticallyImplyLeading: true,
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: Color(0xFFE6EBE0)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(0, 3)
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          height: height / 3.5,
                          alignment: Alignment.center,
                          imageUrl: "${Config.server}/signlearn/assets/icon_foreground.png",
                        ),
                        const SizedBox(height: 10),
                        const Text("This sign language learning app is called SignLearn because its pronunciation is similar to SILENT, which match to the silent world of people who need sign language. SignLearn will focus on basic and daily expression in American Sign Language, the most widely used sign language.", 
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          height: 1.5,
                        ))
                      ],
                    ),
                  )
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("Reference List", 
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20, 
                  ),
                ),
              ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CachedNetworkImage(
                              height: 75,
                              imageUrl: "${Config.server}/signlearn/assets/reference/${imageList[index]}.png",
                            ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(titleList[index],
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    )
                                  ),
                                  const SizedBox(height: 10),
                                  Text("Category: ${referenceList[index]}",
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins'
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
            ]
          ),
        ),
          ),
        );
      }
}