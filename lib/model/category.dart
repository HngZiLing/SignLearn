class Category {
  String? category_id;
  String? category_title;
  String? category_description;

  Category(
    { this.category_id,
      this.category_title,
      this.category_description,
    }
  );

  Category.fromJson(Map<String, dynamic> json) {
    category_id = json['category_id'];
    category_title = json['category_title'];
    category_description = json['category_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = category_id;
    data['category_title'] = category_title;
    data['category_description'] = category_description;
    return data;
  }
}