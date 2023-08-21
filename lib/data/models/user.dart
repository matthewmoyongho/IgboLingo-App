import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? name;
  final String? email;
  final String? photoUrl;
  final int? level;
  final String? phone;

  const User(
      {required this.id,
      this.level,
      this.phone,
      this.name,
      this.email,
      this.photoUrl});
  User copyWith(
      {String? id,
      int? level,
      String? name,
      String? email,
      String? phone,
      String? photoUrl}) {
    return User(
        level: level ?? this.level,
        phone: phone ?? this.phone,
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        photoUrl: photoUrl ?? this.photoUrl);
  }

  static const empty = User(id: '');
  bool get isEmpty => this == empty;
  bool get isNotEmpty => this != empty;

  @override
  List<Object?> get props => [id, name, email, photoUrl, phone];

  factory User.fromJson(DocumentSnapshot<Map<String, dynamic>> json) {
    return User(
      level: json['level'],
      id: json['uid'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      photoUrl: json['photoUrl'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

  static Map<String, dynamic> toMap(User user) {
    final result = <String, dynamic>{};

    result.addAll({'uid': user.id});

    if (user.name != null) {
      result.addAll({'name': user.name});
    }
    if (user.level != null) {
      result.addAll({'level': user.name});
    }
    if (user.phone != null) {
      result.addAll({'phone': user.phone});
    }
    result.addAll({'email': user.email});
    result.addAll({'photoUrl': user.photoUrl});

    return result;
  }
}
