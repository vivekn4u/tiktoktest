import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tiktoktest/src/core/util/error/failures.dart';
import 'package:tiktoktest/src/feature/home/data/datasource/video_datasource.dart';
import 'package:tiktoktest/src/feature/home/service/entity/video_entity.dart';
import 'package:tiktoktest/src/feature/home/service/repository/video_repository.dart';

@LazySingleton(as: VideoRepository)

///video repository implementation
class VideoRepositoryImpl extends VideoRepository {
  final SpringServiceDataSource dataSource;

  VideoRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failures, VideoEntity>> getListOfVideos(VideoEntity entity) {
    return dataSource.getListOfVideos(entity);
  }

  @override
  Future<Either<Failures, String>> uploadVideos(File file) {
    return dataSource.uploadVideos(file);
  }
}
