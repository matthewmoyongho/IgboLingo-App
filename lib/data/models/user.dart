import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String? name;
  final String? email;
  final String? photoUrl;

  const User({required this.id, this.name, this.email, this.photoUrl});
  User copyWith({String? id, String? name, String? email, String? photoUrl}) {
    return User(
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
}
