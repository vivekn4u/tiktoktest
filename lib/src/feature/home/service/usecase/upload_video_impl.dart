import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tiktoktest/src/core/util/error/failures.dart';
import 'package:tiktoktest/src/feature/home/service/repository/video_repository.dart';
import 'package:tiktoktest/src/feature/home/service/usecase/video_usecase.dart';

@LazySingleton(as: UploadVideoFromService)

///implementation to get the video list
class UploadVideoFromServiceImpl extends UploadVideoFromService {
  final VideoRepository videoRepository;

  UploadVideoFromServiceImpl({required this.videoRepository});

  @override
  Future<Either<Failures, String?>>? call(VideoUploadParams params) {
    return videoRepository.uploadVideos(params.file);
  }
}
