import 'package:equatable/equatable.dart';
import 'package:tiktoktest/src/core/util/error/failures.dart';
import 'package:tiktoktest/src/feature/home/service/entity/video_entity.dart';

abstract class VideoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class VideoStateInitialState extends VideoState {}

class VideoStateLoadingState extends VideoState {}

class VideoStateCompletedState extends VideoState {
  final VideoEntity? entity;

  VideoStateCompletedState({required this.entity});

  @override
  List<Object?> get props => [entity];
}

class VideoStateErrorState extends VideoState {
  final Failures failures;

  VideoStateErrorState({required this.failures});

  @override
  List<Object?> get props => [failures];
}
