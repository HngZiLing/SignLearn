class Video {
  String? video_id;
  String? video_title;
  String? video_url;
  String? category_id;

  Video(
    { this.video_id,
      this.video_title,
      this.video_url,
      this.category_id,
    }
  );

  Video.fromJson(Map<String, dynamic> json) {
    video_id = json['video_id'];
    video_title = json['video_title'];
    video_url = json['video_url'];
    category_id = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['video_id'] = video_id;
    data['video_title'] = video_title;
    data['video_url'] = video_url;
    data['category_id'] = category_id;
    return data;
  }
}