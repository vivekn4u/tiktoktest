import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:tiktoktest/src/core/util/usecase/usecase.dart';
import 'package:tiktoktest/src/feature/home/service/entity/video_entity.dart';

///[marker interface] for video use case
abstract class VideoUseCases {}

///abstraction to get video list
abstract class GetVideoListFromService extends VideoUseCases
    implements UseCase<VideoEntity?, VideoParams> {}

///abstraction to upload video
abstract class UploadVideoFromService extends VideoUseCases
    implements UseCase<String?, VideoUploadParams> {}

///video parameters
class VideoParams extends Equatable {
  final VideoEntity entity;

  const VideoParams({required this.entity});

  @override
  List<Object?> get props => [entity];
}

///video parameters
class VideoUploadParams extends Equatable {
  final File file;

  const VideoUploadParams({required this.file});

  @override
  List<Object?> get props => [file];
}
