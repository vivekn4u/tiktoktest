import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tiktoktest/src/core/util/error/failures.dart';
import 'package:tiktoktest/src/feature/home/service/entity/video_entity.dart';

///repository abstraction to connect data source and use cases
abstract class VideoRepository {
  //get list of videos from service url
  Future<Either<Failures, VideoEntity>>? getListOfVideos(VideoEntity entity);

  //get list of videos from service url
  Future<Either<Failures, String>>? uploadVideos(File file);
}
