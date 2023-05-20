import 'package:flutter/material.dart';

class FavouriteProvider extends ChangeNotifier {
  List<String> wordList = [];
  List<String> get getWord => wordList;

  void toggleFavourite(String word){
    final isExist = wordList.contains(word);
    if(isExist) {
      wordList.remove(word);
    } else {
      wordList.add(word);
    }
    notifyListeners();
  }

  bool isExist(String word){
    final isExist = wordList.contains(word);
    return isExist;
  }
  
  void clearFavourite() {
    wordList = [];
    notifyListeners();
  }
}