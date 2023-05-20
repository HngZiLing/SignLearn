import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:signlearn/model/dictionary.dart';
import 'package:signlearn/page/dictionary_page.dart';
import 'package:signlearn/page/profile_page.dart';
import 'package:signlearn/page/category_page.dart';
import 'dart:convert';
import 'package:signlearn/config.dart';
import 'package:http/http.dart' as http;
// import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required String title}):super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  String name = "";
  List <Dictionary> dictionaryList = <Dictionary>[];
  List<String> dictionaryTitle= [];
  late List pages = [];

  @override
  void initState(){
    super.initState();
    loadDictionary();
    pages = [
    const CategoryPage(),
    DictionaryPage(
      onClickedItem: (item) {},
      items: dictionaryTitle),
    const ProfilePage()
    ]; 
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('SignLearn'),
        centerTitle: true,
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
            label: 'Profile'
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

class Palette { 
  static const MaterialColor kToDark = MaterialColor( 
    0xffafc894, 
    <int, Color>{ 
      50: Color(0xfff8c1b8 ),//10% 
      100: Color(0xffC8E6C9),//20% 
      200: Color(0xffA5D6A7),//30% 
      300: Color(0xff81C784),//40% 
      400: Color(0xff66BB6A),//50% 
      500: Color(0xff4CAF50),//60% 
      600: Color(0xff43A047),//70% 
      700: Color(0xff388E3C),//80% 
      800: Color(0xff558B2F),//90% 
      900: Color(0xff1B5E20),//100% 
    }, 
  ); 
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Palette.kToDark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainPage(title: 'SignLearn'),
    );
  }
}
