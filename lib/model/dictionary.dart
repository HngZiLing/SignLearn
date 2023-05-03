class Dictionary {
  String? wordId;
  String? wordTitle;
  String? wordDescription;
  String? category_id;
  String? category_title;

  Dictionary(
    { this.wordId,
      this.wordTitle,
      this.wordDescription,
      this.category_id,
      this.category_title,
    }
  );

  Dictionary.fromJson(Map<String, dynamic> json) {
    wordId = json['word_id'];
    wordTitle = json['word_title'];
    wordDescription = json['word_description'];
    category_id = json['category_id'];
    category_title = json['category_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['word_id'] = wordId;
    data['word_title'] = wordTitle;
    data['word_description'] = wordDescription;
    data['category_id'] = category_id;
    data['category_title'] = category_title;
    return data;
  }

  Dictionary.fromMap(Map<String, String> map) {
    wordId = map['word_id'];
    wordTitle = map['word_title'];
    wordDescription = map['word_description'];
    category_id = map['category_id'];
    category_title = map['category_title'];
  }
}