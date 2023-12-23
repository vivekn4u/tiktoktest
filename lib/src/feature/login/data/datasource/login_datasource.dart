import 'package:dartz/dartz.dart';
import 'package:tiktoktest/src/core/util/error/failures.dart';
import 'package:tiktoktest/src/feature/login/service/entity/user_entity.dart';

///[Marker interface]
abstract class LoginDataSource {}

///firebase specific interface
abstract class FirebaseLoginDataSource extends LoginDataSource {
  ///get current user
  Future<Either<Failures, UserEntity>> currentUser();

  ///get User data from google login
  Future<Either<Failures, UserEntity>> getUserFromGoogleApi();

  ///this function sign out the user out of the application
  Future<Either<Failures, bool>> signedOutUser();

  ///this function checks if the user is signed in
  Future<Either<Failures, bool>> isUserSignedIn();
}
