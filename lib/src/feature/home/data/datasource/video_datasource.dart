import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tiktoktest/src/core/util/error/failures.dart';
import 'package:tiktoktest/src/feature/home/service/entity/video_entity.dart';

///interface for this feature's data source
abstract class VideoDataSource {
  //get list of videos from service url
  Future<Either<Failures, VideoEntity>> getListOfVideos(VideoEntity entity);

  //get list of videos from service url
  Future<Either<Failures, String>> uploadVideos(File file);
}

///interface for spring service
abstract class SpringServiceDataSource extends VideoDataSource {}
