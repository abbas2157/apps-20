class Tip {
  final String id;
  final String title;
  final String content;
  final String categoryId;
  final String imageUrl;

  Tip({
    required this.id,
    required this.title,
    required this.content,
    required this.categoryId,
    this.imageUrl = '',
  });

  factory Tip.fromJson(Map<String, dynamic> json) {
    return Tip(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      categoryId: json['categoryId'],
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}