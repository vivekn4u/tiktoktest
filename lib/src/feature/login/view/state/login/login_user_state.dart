import 'package:equatable/equatable.dart';
import 'package:tiktoktest/src/core/util/error/failures.dart';
import 'package:tiktoktest/src/feature/login/service/entity/user_entity.dart';

abstract class LoginUserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginUserInitialState extends LoginUserState {}

class LoginUserLoadingState extends LoginUserState {}

class LoginUserCompletedState extends LoginUserState {
  final UserEntity? loginUser;

  LoginUserCompletedState({required this.loginUser});

  @override
  List<Object?> get props => [loginUser];
}

class LoginUserErrorState extends LoginUserState {
  final Failures failures;

  LoginUserErrorState({required this.failures});

  @override
  List<Object?> get props => [failures];
}
