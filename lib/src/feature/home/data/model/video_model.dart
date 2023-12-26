import 'package:tiktoktest/src/feature/home/service/entity/video_entity.dart';

class VideoModel extends VideoEntity {
  const VideoModel(
      {final String? serviceUrl,
      final String? name,
      final Map<String, dynamic>? videoList})
      : super(
          name: name,
          serviceUrl: serviceUrl,
          videoList: videoList,
        );

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        serviceUrl: json['serviceUrl'],
        name: json['name'],
        videoList: json['videoList'],
      );
}
