import 'package:dartz/dartz.dart';
import 'package:tiktoktest/src/core/util/error/failures.dart';
import 'package:tiktoktest/src/core/util/usecase/usecase.dart';
import 'package:tiktoktest/src/feature/login/service/entity/user_entity.dart';

///[marker interface] for login use case
abstract class LoginUseCase {}

///get the User data to from Google api
abstract class GetUserProfileFromGoogle extends LoginUseCase
    implements UseCase<UserEntity, NoParams> {
  Future<Either<Failures, UserEntity>> getUserFromGoogleApi();
}

///get current logged in User data
abstract class GetCurrentUserProfile extends LoginUseCase
    implements UseCase<UserEntity, NoParams> {
  Future<Either<Failures, UserEntity>> getCurrentUser();
}

///check if the user is signed in
abstract class IsUserSignedIn extends LoginUseCase
    implements UseCase<bool, NoParams> {
  Future<Either<Failures, bool>> isUserSignedIn();
}

///Signed out the user from the app
abstract class SignedOutUser extends LoginUseCase
    implements UseCase<bool, NoParams> {
  Future<Either<Failures, bool>> signedOutUser();
}
