import 'package:equatable/equatable.dart';
import 'package:tiktoktest/src/core/util/usecase/copyable.dart';

class UserEntity extends Equatable implements Copyable<UserEntity> {
  ///String User ID with unique 16 character code
  final String? id;

  ///String User name
  final String? name;

  ///String User Email
  final String? email;

  ///String User Mobile
  final String? mobile;

  ///String User photo URL from social sites
  final String? photoUrl;

  ///user entity constructor
  const UserEntity(
      {required this.id,
      required this.name,
      required this.email,
      required this.mobile,
      required this.photoUrl});

  @override
  List<Object?> get props => [id, name, email, mobile, photoUrl];

  ///shallow copy of user entity
  @override
  UserEntity? copy() => UserEntity(
      id: id, name: name, email: email, mobile: mobile, photoUrl: photoUrl);

  ///deep copy of user entity
  @override
  UserEntity? copyWith({
    String? id,
    String? name,
    String? email,
    String? mobile,
    String? photoUrl,
  }) =>
      UserEntity(
          id: id ?? this.id,
          name: name ?? this.name,
          email: email ?? this.email,
          mobile: mobile ?? this.mobile,
          photoUrl: photoUrl ?? this.photoUrl);
}
