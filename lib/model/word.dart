class Word {
  String? wordId;
  String? wordTitle;
  String? wordDescription;

  Word(
    { this.wordId,
      this.wordTitle,
      this.wordDescription,
    }
  );

  Word.fromJson(Map<String, dynamic> json) {
    wordId = json['word_id'];
    wordTitle = json['word_title'];
    wordDescription = json['word_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['word_id'] = wordId;
    data['word_title'] = wordTitle;
    data['word_description'] = wordDescription;
    return data;
  }
}