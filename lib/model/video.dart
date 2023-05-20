class Video {
  String? videoId;
  String? videoTitle;
  String? videoUrl;
  String? categoryId;

  Video(
    { this.videoId,
      this.videoTitle,
      this.videoUrl,
      this.categoryId,
    }
  );

  Video.fromJson(Map<String, dynamic> json) {
    videoId = json['video_id'];
    videoTitle = json['video_title'];
    videoUrl = json['video_url'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['video_id'] = videoId;
    data['video_title'] = videoTitle;
    data['video_url'] = videoUrl;
    data['category_id'] = categoryId;
    return data;
  }
}