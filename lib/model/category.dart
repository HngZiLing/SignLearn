class Category {
  String? categoryId;
  String? categoryTitle;
  String? categoryDescription;

  Category(
    { this.categoryId,
      this.categoryTitle,
      this.categoryDescription,
    }
  );

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryTitle = json['category_title'];
    categoryDescription = json['category_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_title'] = categoryTitle;
    data['category_description'] = categoryDescription;
    return data;
  }
}