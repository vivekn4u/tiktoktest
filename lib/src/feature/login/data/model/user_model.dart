import 'package:firebase_auth/firebase_auth.dart';
import 'package:tiktoktest/src/feature/login/service/entity/user_entity.dart';

///user entity mode adapter class
class UserModel extends UserEntity {
  const UserModel({
    final String? id,
    final String? name,
    final String? email,
    final String? mobile,
    final String? photoUrl,
  }) : super(
            id: id,
            name: name,
            email: email,
            mobile: mobile,
            photoUrl: photoUrl);

  /// get user entity from firebase auth
  factory UserModel.fromFirebaseAuth(User user) {
    return UserModel(
      id: user.uid,
      name: user.displayName ?? "Guest",
      email: user.email ?? 'guest@example.com',
      mobile: user.phoneNumber ?? '',
      photoUrl: user.photoURL ?? '',
    );
  }
}
