import 'video.dart';

class Category {
  final String category;
  final List<Video> videos;

  Category({
    required this.category,
    required this.videos,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    var list = json['videos'] as List;
    List<Video> videoList = list.map((i) => Video.fromJson(i as Map<String, dynamic>)).toList();
    return Category(
      category: json['category'] as String,
      videos: videoList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'videos': videos.map((v) => v.toJson()).toList(),
    };
  }
}
