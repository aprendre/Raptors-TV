class Video {
  final String id;
  final String title;
  final String url;
  final String thumbnail;
  final String duration;

  Video({
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnail,
    required this.duration,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnail: json['thumbnail'] as String,
      duration: json['duration'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'url': url,
      'thumbnail': thumbnail,
      'duration': duration,
    };
  }
}
