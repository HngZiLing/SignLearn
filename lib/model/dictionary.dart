class Dictionary {
  String? wordId;
  String? wordTitle;
  String? wordDescription;
  String? categoryId;
  String? categoryTitle;

  Dictionary(
    { this.wordId,
      this.wordTitle,
      this.wordDescription,
      this.categoryId,
      this.categoryTitle,
    }
  );

  Dictionary.fromJson(Map<String, dynamic> json) {
    wordId = json['word_id'];
    wordTitle = json['word_title'];
    wordDescription = json['word_description'];
    categoryId = json['category_id'];
    categoryTitle = json['category_title'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['word_id'] = wordId;
    data['word_title'] = wordTitle;
    data['word_description'] = wordDescription;
    data['category_id'] = categoryId;
    data['category_title'] = categoryTitle;
    return data;
  }
}