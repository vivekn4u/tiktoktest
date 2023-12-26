import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tiktoktest/src/core/util/error/failures.dart';
import 'package:tiktoktest/src/feature/home/service/entity/video_entity.dart';
import 'package:tiktoktest/src/feature/home/service/repository/video_repository.dart';
import 'package:tiktoktest/src/feature/home/service/usecase/video_usecase.dart';

@LazySingleton(as: GetVideoListFromService)

///implementation to get the video list
class GetVideoListFromServiceImpl extends GetVideoListFromService {
  final VideoRepository videoRepository;

  GetVideoListFromServiceImpl({required this.videoRepository});

  @override
  Future<Either<Failures, VideoEntity?>>? call(VideoParams params) {
    return videoRepository.getListOfVideos(params.entity);
  }
}
