import 'package:dartz/dartz.dart';
import 'package:tiktoktest/src/core/util/error/failures.dart';
import 'package:tiktoktest/src/feature/login/service/entity/user_entity.dart';

///[Marker Interface] for login repository
// abstract class LoginRepository {}

/// remote login repository interface
abstract class LoginRepository {
  ///get User data from google login
  Future<Either<Failures, UserEntity>> getUserFromGoogleApi();

  ///get current user data from app
  Future<Either<Failures, UserEntity>> getCurrentUser();

  ///check if the user is signed in
  Future<Either<Failures, bool>> isUserSignedIn();

  ///signed out the user from application
  Future<Either<Failures, bool>> signedOutUser();
}
