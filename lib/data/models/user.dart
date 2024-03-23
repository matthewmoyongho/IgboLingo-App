import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String? name;
  final String? email;
  final int? level;

  const User({
    required this.id,
    this.level,
    this.name,
    this.email,
  });
  User copyWith({String? id, int? level, String? name, String? email}) {
    return User(
      level: level ?? this.level,
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  static const empty = User(id: '');
  bool get isEmpty => this == empty;
  bool get isNotEmpty => this != empty;

  @override
  List<Object?> get props => [id, name, email];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      level: json['level'],
      id: json['uid'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
    );
  }

  static Map<String, dynamic> toMap(User user) {
    final result = <String, dynamic>{};

    result.addAll({'uid': user.id});

    if (user.name != null) {
      result.addAll({'name': user.name});
    }
    if (user.level != null) {
      result.addAll({'level': user.level});
    }

    if (user.email != null) {
      result.addAll({'email': user.email});
    }

    return result;
  }
}
