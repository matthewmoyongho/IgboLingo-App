import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String? name;
  final String? email;
  final String? photoUrl;
  final String? gender;

  const User(
      {required this.id, this.gender, this.name, this.email, this.photoUrl});
  User copyWith(
      {String? id,
      String? gender,
      String? name,
      String? email,
      String? photoUrl}) {
    return User(
        gender: gender ?? this.gender,
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        photoUrl: photoUrl ?? this.photoUrl);
  }

  static const empty = User(id: '');
  bool get isEmpty => this == empty;
  bool get isNotEmpty => this != empty;

  @override
  List<Object?> get props => [id, name, email, photoUrl];

  factory User.fromJson(DocumentSnapshot<Object?> json) {
    return User(
      id: json['id'],
      gender: json['gender'],
      name: json['name'],
      email: json['email'],
      photoUrl: json['photoUrl'],
    );
  }

  static Map<String, dynamic> toMap(User user) {
    final result = <String, dynamic>{};

    result.addAll({'uid': user.id});

    if (user.gender != null) {
      result.addAll({'gender': user.gender});
    }
    if (user.name != null) {
      result.addAll({'name': user.name});
    }
    result.addAll({'email': user.id});
    result.addAll({'photoUrl': user.id});

    return result;
  }
}
