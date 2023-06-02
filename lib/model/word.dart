class Word {
  String? wordId;
  String? wordTitle;
  String? wordDescription;
  String? categoryId;

  Word({
    this.wordId,
    this.wordTitle,
    this.wordDescription,
    this.categoryId,
  });

  Word.fromJson(Map<String, dynamic> json) {
    wordId = json['word_id'];
    wordTitle = json['word_title'];
    wordDescription = json['word_description'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['word_id'] = wordId;
    data['word_title'] = wordTitle;
    data['word_description'] = wordDescription;
    data['category_id'] = categoryId;
    return data;
  }
}
