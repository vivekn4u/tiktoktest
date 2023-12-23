import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tiktoktest/src/core/util/error/failures.dart';
import 'package:tiktoktest/src/core/util/usecase/usecase.dart';
import 'package:tiktoktest/src/feature/login/service/repository/login_repository.dart';
import 'package:tiktoktest/src/feature/login/service/usecase/login_usecase.dart';

@LazySingleton(as: SignedOutUser)

///sign out the user
class SignedOutUserImpl extends SignedOutUser {
  final LoginRepository repository;

  SignedOutUserImpl({required this.repository});

  @override
  Future<Either<Failures, bool>>? call(NoParams params) {
    return signedOutUser();
  }

  @override
  Future<Either<Failures, bool>> signedOutUser() {
    return repository.signedOutUser();
  }
}
