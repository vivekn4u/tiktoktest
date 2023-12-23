import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tiktoktest/src/core/util/error/failures.dart';
import 'package:tiktoktest/src/core/util/usecase/usecase.dart';
import 'package:tiktoktest/src/feature/login/service/entity/user_entity.dart';
import 'package:tiktoktest/src/feature/login/service/repository/login_repository.dart';
import 'package:tiktoktest/src/feature/login/service/usecase/login_usecase.dart';

///dependency injection, always use abstraction over implementation
@LazySingleton(as: GetUserProfileFromGoogle)

///A use case to log in user using Google ID.
class GetUserProfileFromGoogleImpl extends GetUserProfileFromGoogle {
  final LoginRepository loginRepository;

  ///Creates an instance of the [GetUserProfileFromGoogle] usecase.
  ///
  GetUserProfileFromGoogleImpl({required this.loginRepository});

  @override
  Future<Either<Failures, UserEntity>>? call(NoParams params) {
    return getUserFromGoogleApi();
  }

  @override
  Future<Either<Failures, UserEntity>> getUserFromGoogleApi() {
    final result = loginRepository.getUserFromGoogleApi();
    return result;
  }
}
