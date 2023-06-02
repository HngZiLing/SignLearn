import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signlearn/favourite_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:signlearn/model/dictionary.dart';
// import 'package:signlearn/page/dictionary_page.dart';
// import 'package:signlearn/page/Favourite_page.dart';
import 'package:signlearn/page/category_page.dart';
// import 'dart:convert';
import 'package:signlearn/config.dart';
import 'package:signlearn/page/main_page.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}):super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  // int index = 0;
  // String name = "";
  // List <Dictionary> dictionaryList = <Dictionary>[];
  // List<String> dictionaryTitle= [];
  // late List pages = [];
  
  @override
  void initState(){
    super.initState();
    // loadDictionary();
    // pages = [
    // const CategoryPage(),
    // DictionaryPage(
    //   onClickedItem: (item) {},
    //   items: dictionaryTitle),
    // const FavouritePage()
    // ]; 
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (content) => const MainScreen()))
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
            children: [
              Image.network(Config.server + "/signlearn/assets/background.png",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
              Container(
                width: 300,
                alignment: Alignment.center,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl: Config.server + "/signlearn/assets/splash3.png",
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 25),
                    const LinearProgressIndicator(
                      backgroundColor: Color(0xFFF9F9F9), 
                      minHeight: 25,
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF7dd68b)),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: const Text("Signlearn 1.0 @ 2023", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16, 
                    color: Colors.black,
                  )
                )
              )
            ]
          ),
      // body: Stack(
      //       children: [
      //         Image.network('https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA4L2pvYjEwODAtYmFja2dyb3VuZC0wM2Etdl8xLmpwZw.jpg',
      //         fit: BoxFit.contain),
      //         Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               CachedNetworkImage(
      //                 imageUrl: Config.server + "/signlearn/assets/splash.png",
      //                 fit: BoxFit.fitWidth,
      //               ),
      //               const LinearProgressIndicator(backgroundColor: Colors.grey, valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF9F9F9))),
      //             ],
      //           ),
      //         const Text("Signlearn 1.0 @ 2023", 
      //         textAlign: TextAlign.end,
      //         style: TextStyle(
      //           fontSize: 16, 
      //           fontWeight: FontWeight.bold, 
      //           color: Colors.white,)
      //         )
      //       ]
      //     ),
      
      // appBar: AppBar(
      //   title: const Text('SignLearn'),
      //   centerTitle: true,
      //   backgroundColor: const Color(0xFFACD783),
      // ),
      // body: pages[index],
      // bottomNavigationBar: NavigationBar(
      //   height: 60,
      //   labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      //   selectedIndex: index,
      //   onDestinationSelected: (index) => setState(() =>this.index = index),
      //   destinations: const [
      //     NavigationDestination(
      //       icon: Icon(Icons.view_list_outlined),
      //       selectedIcon: Icon(Icons.view_list), 
      //       label: 'Category'
      //     ),
      //     NavigationDestination(
      //       icon: Icon(Icons.search_rounded),
      //       selectedIcon: Icon(Icons.search_outlined), 
      //       label: 'Dictionary'
      //     ),
      //     NavigationDestination(
      //       icon: Icon(Icons.favorite_outline),
      //       selectedIcon: Icon(Icons.favorite), 
      //       label: 'Save'
      //     ),
      //   ],
      // ),
    );
  }

  // void loadDictionary(){
  // http.post(
  //  Uri.parse("${Config.server}/signlearn/php/load_dictionary.php")
  // ).then((response) {
  //     var jsondata = jsonDecode(response.body);
  //     if (response.statusCode == 200 && jsondata['status'] == 'success') {
  //       var extractdata = jsondata['data'];
  //       if (extractdata['dictionary'] != null) {
  //           dictionaryList = <Dictionary>[];
  //           extractdata['dictionary'].forEach((v) {
  //           dictionaryList.add(Dictionary.fromJson(v));
  //           name = Dictionary.fromJson(v).wordTitle.toString();
  //           dictionaryTitle.add(name);
  //         });
  //         setState(() { });
  //       }
  //     } 
  //   }).timeout(
  //   const Duration(seconds: 60), 
  //   onTimeout:(){
  //     return;
  //   },
  //   );
  // }
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
    return ChangeNotifierProvider(
      create: (context) => FavouriteProvider(),
      child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Palette.kToDark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainPage(),
    )
    );
  }
}

// class Splash extends StatelessWidget {
//   const Splash({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//             children: [
//               Image.network('https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA4L2pvYjEwODAtYmFja2dyb3VuZC0wM2Etdl8xLmpwZw.jpg',
//               fit: BoxFit.contain),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CachedNetworkImage(
//                       imageUrl: Config.server + "/signlearn/assets/splash.png",
//                       fit: BoxFit.fitWidth,
//                     ),
//                     const LinearProgressIndicator(backgroundColor: Colors.grey, valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF9F9F9))),
//                   ],
//                 ),
//               const Text("Signlearn 1.0 @ 2023", 
//               textAlign: TextAlign.end,
//               style: TextStyle(
//                 fontSize: 16, 
//                 fontWeight: FontWeight.bold, 
//                 color: Colors.white,)
//               )
//             ]
//           ),
//     );
//   }
// }
 