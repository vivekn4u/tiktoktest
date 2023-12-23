import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tiktoktest/src/core/util/error/failures.dart';
import 'package:tiktoktest/src/core/util/usecase/usecase.dart';
import 'package:tiktoktest/src/feature/login/service/entity/user_entity.dart';
import 'package:tiktoktest/src/feature/login/service/repository/login_repository.dart';
import 'package:tiktoktest/src/feature/login/service/usecase/login_usecase.dart';

@LazySingleton(as: GetCurrentUserProfile)

///get the current logged in user details
class GetCurrentUserProfileImpl extends GetCurrentUserProfile {
  final LoginRepository repository;

  GetCurrentUserProfileImpl({required this.repository});

  @override
  Future<Either<Failures, UserEntity>>? call(NoParams params) {
    return getCurrentUser();
  }

  @override
  Future<Either<Failures, UserEntity>> getCurrentUser() {
    return repository.getCurrentUser();
  }
}
