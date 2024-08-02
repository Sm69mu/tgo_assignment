class Exercise {
  final String id;
  final String title;
  final String coverImage;

  Exercise({
    required this.id,
    required this.title,
    required this.coverImage,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['_id'],
      title: json['title'],
      coverImage: json['cover_image'],
    );
  }
}
