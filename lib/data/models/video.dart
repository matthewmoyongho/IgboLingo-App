import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  String name;
  String description;
  String mediaUrl;
  String category;
  Video(
      {required this.name,
      required this.category,
      required this.mediaUrl,
      required this.description});

  factory Video.fromJson(DocumentSnapshot json) {
    return Video(
        category: json['category'],
        name: json['title'],
        mediaUrl: json['videoUrl'],
        description: json['description']);
  }
}
