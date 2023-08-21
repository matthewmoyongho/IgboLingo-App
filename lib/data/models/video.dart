import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  String name;
  String description;
  String mediaUrl;
  String category;
  String thumbnail;
  Video(
      {required this.name,
      required this.category,
      required this.mediaUrl,
      required this.description,
      required this.thumbnail});

  factory Video.fromJson(DocumentSnapshot json) {
    return Video(
        thumbnail: json['thumbnail'],
        category: json['category'],
        name: json['title'],
        mediaUrl: json['videoUrl'],
        description: json['description']);
  }
}
