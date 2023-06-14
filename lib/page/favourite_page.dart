import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config.dart';
import '../favourite_provider.dart';
import 'package:http/http.dart' as http;

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);
  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  String id = "", title = "", description = "", category = "";

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context);
    final words = provider.getWord;
    
    return Scaffold(
    body: words.isEmpty
    ? Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Expanded(flex: 1, child: Padding(padding: EdgeInsets.all(15),
            child: Text("You can click icon on the word page to add it here",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, height: 1.3, fontWeight: FontWeight.bold) ))),
            Expanded(flex: 9, child: CachedNetworkImage(
              imageUrl: "${Config.server}/signlearn/assets/instruction.png",
            )),
            ],
        )
        
          ),
         ) 
                  
      : SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 1,
                ),
                itemCount: words.length,
                itemBuilder: (context, index) {
                  final word = words[index];
                  return InkWell(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color(0xFFE6EBE0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 8,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    imageUrl: Config.server + "/signlearn/assets/asl/" + word + '.png',
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 7,
                                        child: Text(word,
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Raleway',
                                            height: 1.2
                                          )
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: IconButton(
                                          alignment: Alignment.centerRight,
                                          onPressed: () {provider.toggleFavourite(word);},
                                          icon: provider.isExist(word) ? 
                                          const Icon(Icons.favorite,color: Colors.red) : const Icon(Icons.favorite_border)
                                        ),
                                      )
                                    ],
                                  )
                                )
                              )
                            ],
                          )
                        )
                      )
                    )
                  );
                }
              )
            )
          ]
        )
      )
    );
  }

  void loadWord(String search) {
    String id = search;
    http.post(
      Uri.parse("${Config.server}/signlearn/php/load_dictionary_word.php"),
      body: {
        'search': id,
      }
    ).then((response) {
      var jsondata = jsonDecode(response.body);
      if (response.statusCode == 200 && jsondata['status'] == 'success') {
        id = jsondata['data']['word_id'].toString();
        title = jsondata['data']['word_title'].toString();
        description = jsondata['data']['word_description'].toString();
        category = jsondata['data']['category_id'].toString();
        setState(() {});
      }
    }).timeout(
      const Duration(seconds: 60),
      onTimeout: () {
        return;
      },
    );
  }
}
