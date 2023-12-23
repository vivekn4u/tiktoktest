import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tiktoktest/src/core/util/error/failures.dart';
import 'package:tiktoktest/src/feature/login/data/datasource/login_datasource.dart';
import 'package:tiktoktest/src/feature/login/service/entity/user_entity.dart';
import 'package:tiktoktest/src/feature/login/service/repository/login_repository.dart';

@LazySingleton(as: LoginRepository)

///Queries the datasource for any authentication requests.
///Implements [LoginRepository].
///
///Requires:
/// * [FirebaseLoginDataSource]
///
class LoginRepositoryImpl extends LoginRepository {
  final FirebaseLoginDataSource firebaseLoginDataSource;

  LoginRepositoryImpl({required this.firebaseLoginDataSource});

  @override
  Future<Either<Failures, UserEntity>> getCurrentUser() async {
    try {
      final userEntityRemote = await firebaseLoginDataSource.currentUser();

      return userEntityRemote;
    } on Exception {
      return const Left(
          CacheFailure(message: 'Error: while connecting to server!!'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> getUserFromGoogleApi() async {
    try {
      final userEntityRemote =
          await firebaseLoginDataSource.getUserFromGoogleApi();

      return userEntityRemote;
    } on Exception {
      return const Left(
          CacheFailure(message: 'Error: while connecting to server!!'));
    }
  }

  @override
  Future<Either<Failures, bool>> isUserSignedIn() async {
    try {
      final userEntityRemote = await firebaseLoginDataSource.isUserSignedIn();

      return userEntityRemote;
    } on Exception {
      return const Left(
          CacheFailure(message: 'Error: while connecting to server!!'));
    }
  }

  @override
  Future<Either<Failures, bool>> signedOutUser() async {
    try {
      final userEntityRemote = await firebaseLoginDataSource.signedOutUser();

      return userEntityRemote;
    } on Exception {
      return const Left(
          CacheFailure(message: 'Error: while connecting to server!!'));
    }
  }
}
