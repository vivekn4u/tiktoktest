import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tiktoktest/src/core/util/error/failures.dart';
import 'package:tiktoktest/src/core/util/usecase/usecase.dart';
import 'package:tiktoktest/src/feature/login/service/repository/login_repository.dart';
import 'package:tiktoktest/src/feature/login/service/usecase/login_usecase.dart';

@LazySingleton(as: IsUserSignedIn)

///check if the user is signed in or not
class IsUserSignedInImpl extends IsUserSignedIn {
  final LoginRepository repository;

  IsUserSignedInImpl({required this.repository});

  @override
  Future<Either<Failures, bool>>? call(NoParams params) {
    return isUserSignedIn();
  }

  @override
  Future<Either<Failures, bool>> isUserSignedIn() {
    return repository.isUserSignedIn();
  }
}
