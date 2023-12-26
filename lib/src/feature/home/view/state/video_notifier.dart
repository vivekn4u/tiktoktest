import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:tiktoktest/src/core/util/error/failures.dart';
import 'package:tiktoktest/src/feature/home/service/entity/video_entity.dart';
import 'package:tiktoktest/src/feature/home/service/usecase/video_usecase.dart';
import 'package:tiktoktest/src/feature/home/view/state/video_state.dart';

@lazySingleton
class VideoStateNotifierImpl extends StateNotifier<VideoState> {
  VideoStateNotifierImpl({required this.getVideoListFromService})
      : super(VideoStateInitialState());

  final GetVideoListFromService getVideoListFromService;

  void getVideoList(String serviceUrl) {
    VideoEntity entity =
        VideoEntity(serviceUrl: serviceUrl, name: "", videoList: null);

    try {
      state = VideoStateLoadingState();
      getVideoListFromService(VideoParams(entity: entity))?.then((data) {
        data.fold((l) => state = VideoStateErrorState(failures: l),
            (r) => state = VideoStateCompletedState(entity: r));
      });
    } on Exception {
      state = VideoStateErrorState(
          failures: const ServerFailure(message: "Error: contact support!!"));
    }
  }
}
