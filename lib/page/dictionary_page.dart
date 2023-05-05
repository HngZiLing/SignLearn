import 'dart:async';

import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:signlearn/page/category_word_page.dart';
import '../model/word.dart';
import 'dart:convert';
import '../config.dart';
import 'package:http/http.dart' as http;

class _AZItem extends ISuspensionBean{
  final String title;
  final String tag;

  _AZItem({
    required this.title,
    required this.tag,
  });

  @override
  String getSuspensionTag()=>tag;
}

class DictionaryPage extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String> onClickedItem;
  const DictionaryPage({Key? key, required this.items, required this.onClickedItem}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  List dictionaryList = [];
  String titlecenter = "Loading data";
  List<_AZItem> items = [];
  List<Word> wordList = <Word>[];

  @override
  void initState(){
    super.initState();
    initList(widget.items);
  }

  void initList(List<String> items){
    this.items=items.map((item)=>_AZItem(title:item, tag:item[0].toUpperCase())).toList();

    SuspensionUtil.sortListBySuspensionTag(this.items);
    SuspensionUtil.setShowSuspensionStatus(this.items);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => AzListView(
    padding: const EdgeInsets.all(16),
    data: items,
    itemCount: items.length,
    itemBuilder: (context, index){
      final item = items[index];
      return _buildListItem(item);
    },

    indexHintBuilder: (context, hint) => Container(
      alignment: Alignment.center,
      width: 60,
      height: 60,
      decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
      child: Text(
        hint,
        style: const TextStyle(color: Colors.white, fontSize: 30),
      ),
    ),

    indexBarMargin: const EdgeInsets.all(10),
    indexBarOptions: const IndexBarOptions(
      needRebuild: true,
      selectTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),

      selectItemDecoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),

      indexHintAlignment: Alignment.centerRight,
      indexHintOffset: Offset(-20,0),
    ),
  );

  Widget _buildListItem(_AZItem item){
    final tag = item.getSuspensionTag();
    final offstage = !item.isShowSuspension;
    
    return Column(
      children: <Widget>[
        Offstage(offstage: offstage, child: buildHeader(tag)),
        Container(
          margin: const EdgeInsets.only(right: 16),
          child: ListTile(
            title: Text(item.title),
            onTap: () => {
              loadWord(item.title),
            },
          ),
        ),
      ],
    );
  }

  Widget buildHeader(String tag)=> Container(
    height: 40,
    margin: const EdgeInsets.only(right: 16),
    padding: const EdgeInsets.only(left: 16),
    color: Colors.grey.shade300,
    alignment: Alignment.centerLeft,
    child: Text(
      tag,
      softWrap: false,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );

  void loadWord(String search){
    String id, description, category;
    String title = search;
  http.post(
   Uri.parse(Config.server + "/signlearn/php/load_dictionary_word.php"),
   body: {
    'search' : title,
    }).then((response) {
      var jsondata = jsonDecode(response.body);
      if (response.statusCode == 200 && jsondata['status'] == 'success') {
        id = jsondata['data']['word_id'].toString();
        title = jsondata['data']['word_title'].toString(); 
        description = jsondata['data']['word_description'].toString();
        category = jsondata['data']['category_id'].toString();

        Navigator.push(context, MaterialPageRoute(
          builder: (content) => 
          CategoryWordPage(
            id: id, 
            title: title, 
            description: description,
            category: category
            )
            ));
      }
    }).timeout(
    const Duration(seconds: 60), 
    onTimeout:(){
      return;
    },
    );
  }
}