import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:signlearn/config.dart';
import 'package:http/http.dart' as http;
import 'package:signlearn/page/category_page.dart';
import 'package:signlearn/page/dictionary_page.dart';
import 'package:signlearn/page/Favourite_page.dart';
import 'package:signlearn/model/dictionary.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState()=> _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int index = 0;
  String name = "";
  List <Dictionary> dictionaryList = <Dictionary>[];
  List<String> dictionaryTitle= [];
  late List pages = [];

  @override
  void initState() {
    super.initState();
    loadDictionary();
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
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('SignLearn'),
        centerTitle: true,
        backgroundColor: const Color(0xFFACD783),
      ),
      body: pages[index],
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
}