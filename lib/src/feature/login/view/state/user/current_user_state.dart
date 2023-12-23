import 'package:equatable/equatable.dart';
import 'package:tiktoktest/src/core/util/error/failures.dart';
import 'package:tiktoktest/src/feature/login/service/entity/user_entity.dart';

abstract class CurrentUserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CurrentUserInitialState extends CurrentUserState {}

class CurrentUserLoadingState extends CurrentUserState {}

class CurrentUserCompletedState extends CurrentUserState {
  final UserEntity? currentUser;

  CurrentUserCompletedState({required this.currentUser});

  @override
  List<Object?> get props => [currentUser];
}

class CurrentUserErrorState extends CurrentUserState {
  final Failures failures;

  CurrentUserErrorState({required this.failures});

  @override
  List<Object?> get props => [failures];
}
