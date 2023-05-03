import 'package:flutter/material.dart';
import 'package:signlearn/model/dictionary.dart';
import 'package:signlearn/page/dictionary_page.dart';
import 'package:signlearn/page/profile_page.dart';
import 'package:signlearn/page/category_page.dart';
import 'dart:convert';
import 'package:signlearn/config.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required String title}):super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

List data = [];

class _MainPageState extends State<MainPage> {
  int index = 0;
   List <String?> dictionaryList = [];

  @override
  void initState(){
    super.initState();
    loadDictionary();
  }

  @override
  Widget build(BuildContext context) {
    ListView.builder(
      itemCount: dictionaryList.length,
      itemBuilder: (context, index){
      dictionaryList = (data[index]["dictionary"] as List<Map<String, String>>).map((e) => e["word_title"]).toList();
    },
    );
    
    final pages = [
    const CategoryPage(),
    DictionaryPage(
      onClickedItem: (item) {},
      items: dictionaryList.toList()),
    const ProfilePage()
  ]; 

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
}
  
void loadDictionary(){
  http.post(
   Uri.parse(Config.server + "/signlearn/php/load_dictionary.php"),
   body: {
    }).then((response) {
      var jsondata = jsonDecode(response.body);
      // jsondata = List<Map<String, dynamic>>.from(jsonDecode(response.body));
      if (response.statusCode == 200 && jsondata['status'] == 'success') {
        var extractdata = jsondata['data'];
        if (extractdata['dictionary'] != null) {
          jsondata = List<Map<String, dynamic>>.from(jsonDecode(response.body));
          extractdata = jsondata.map((m) => Dictionary.fromMap(Map<String, String>.from(m))).toList();
          data = extractdata;
          print("data" + extractdata);
          // dictionaryList = extractdata.map<Dictionary>((json) => Dictionary.fromJson(json)).toList();
          // extractdata['dictionary'].forEach((v) {
          // dictionaryList.add(Dictionary.fromJson(v) as String);
          // print(extractdata);
          // });
          // setState(() { });
        }
      } 
    }).timeout(
    const Duration(seconds: 60), 
    onTimeout:(){
      return;
    },
    );
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
