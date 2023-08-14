import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  String name;
  String description;
  String mediaUrl;
  Video(
      {required this.name, required this.mediaUrl, required this.description});

  factory Video.fromJson(DocumentSnapshot json) {
    return Video(
        name: json['name'],
        mediaUrl: json['thumbnail'],
        description: json['mediaUrl']);
  }
}
