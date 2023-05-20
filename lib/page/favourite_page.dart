import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config.dart';
import '../favourite_provider.dart';
import 'package:http/http.dart' as http;

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}):super(key: key);
  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  String id="", title="", description="", category="";

  @override
  Widget build(BuildContext context){
    final provider = Provider.of<FavouriteProvider>(context);
    final words = provider.getWord;
    
    return Scaffold(
      body: ListView.builder( 
      itemCount: words.length,
      itemBuilder: (context, index) {
        final word = words[index];
        loadWord(word);
        return ListTile(
          leading: CachedNetworkImage(imageUrl: Config.server + "/signlearn/assets/c" + category + "/" + id + '.png'),
          title: Text(word),
          trailing: IconButton(
            onPressed: () {
              provider.toggleFavourite(word);
            },
            icon: provider.isExist(word)
            ? const Icon(Icons.favorite, color: Colors.red)
            : const Icon(Icons.favorite_border) 
          ),
        );
      })

    );
  }

  void loadWord(String search){
    String title = search;
  http.post(
   Uri.parse("${Config.server}/signlearn/php/load_dictionary_word.php"),
   body: {
    'search' : title,
    }).then((response) {
      var jsondata = jsonDecode(response.body);
      if (response.statusCode == 200 && jsondata['status'] == 'success') {
        id = jsondata['data']['word_id'].toString();
        title = jsondata['data']['word_title'].toString(); 
        description = jsondata['data']['word_description'].toString();
        category = jsondata['data']['category_id'].toString();

        // Navigator.push(context, MaterialPageRoute(
        //   builder: (content) => 
        //   CategoryWordPage(
        //     id: id, 
        //     title: title, 
        //     description: description,
        //     category: category
        //     )
        //     ));
      }
    }).timeout(
    const Duration(seconds: 60), 
    onTimeout:(){
      return;
    },
    );
  }
}