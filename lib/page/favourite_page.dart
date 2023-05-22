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
      body: SafeArea(
        child: 
          Column(
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
        return SingleChildScrollView(
          child : InkWell(
            child : 
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
              child: 
              Container(
          margin: const EdgeInsets.fromLTRB(10, 20, 10, 15),
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color(0xFFE6EBE0),
          ),
          child: Padding(
              padding: EdgeInsets.all(10),
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
              child: Row(
              children: [
                Text(word, 
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 20, 
                  fontFamily: 'Raleway', 
                  height:1.5,fontWeight: 
                  FontWeight.bold,
                )),
                IconButton(
                  alignment: Alignment.centerRight,
            onPressed: () {
              provider.toggleFavourite(word);
            },
            icon: provider.isExist(word)
            ? const Icon(Icons.favorite, color: Colors.red)
            : const Icon(Icons.favorite_border) 
          ),
              ],
            )
            
          )
          ],
        ))
        )
            )
          )
        );

      })
                )
                
                
      //           ListView.builder( 
      // itemCount: words.length,
      // itemBuilder: (context, index) {
      //   final word = words[index];
      //   return SingleChildScrollView(
      //     child : InkWell(
            // onTap : ()=> {
            //   Navigator.push(context, MaterialPageRoute( 
            //     builder: (content) => CategoryDetailsPage(categoryTitle: categoryList[index].categoryTitle.toString(), categoryId : search)
            //     ))
            //   },
        //     child : Padding(
        //       padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
        //       child: Container(
        //   margin: const EdgeInsets.fromLTRB(10, 15, 10, 15),
        //   height: 80,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(25),
        //     color: const Color(0xFFE6EBE0),
        //   ),
        //   child: ListTile(
        //   leading: CircleAvatar(
        //     radius: 25,
        //   backgroundImage: NetworkImage(Config.server + "/signlearn/assets/asl/" + word + '.png'),
        // ),
        //   title: Text(word, style: const TextStyle(fontSize: 20, fontFamily: 'Raleway', height:1.5,fontWeight: FontWeight.bold,)),
        //   trailing: IconButton(
        //     onPressed: () {
        //       provider.toggleFavourite(word);
        //     },
        //     icon: provider.isExist(word)
        //     ? const Icon(Icons.favorite, color: Colors.red)
        //     : const Icon(Icons.favorite_border) 
        //   ),
        // )
        // )

        //     )
      //     )
      //   );
  
        
        
      
      // })
              // )
            ]
          )
      )
    );
  }

  void loadWord(String search){
    String id = search;
    http.post(
   Uri.parse("${Config.server}/signlearn/php/load_dictionary_word.php"),
   body: {
    'search' : id,
    }).then((response) {
      var jsondata = jsonDecode(response.body);
      if (response.statusCode == 200 && jsondata['status'] == 'success') {
        id = jsondata['data']['word_id'].toString();
        title = jsondata['data']['word_title'].toString(); 
        description = jsondata['data']['word_description'].toString();
        category = jsondata['data']['category_id'].toString();
        setState(() {});
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