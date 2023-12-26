import 'package:equatable/equatable.dart';
import 'package:tiktoktest/src/core/util/usecase/copyable.dart';

///class to store video data
class VideoEntity extends Equatable implements Copyable<VideoEntity> {
  final String? serviceUrl;
  final String? name;
  final Map<String, dynamic>? videoList;

  const VideoEntity(
      {required this.serviceUrl, required this.name, required this.videoList});

  @override
  VideoEntity? copy() =>
      VideoEntity(serviceUrl: serviceUrl, name: name, videoList: videoList);

  @override
  VideoEntity? copyWith({
    String? serviceUrl,
    String? name,
    Map<String, dynamic>? videoList,
  }) =>
      VideoEntity(
        serviceUrl: serviceUrl ?? this.serviceUrl,
        name: name ?? this.name,
        videoList: videoList ?? this.videoList,
      );

  @override
  List<Object?> get props => [serviceUrl, name, videoList];
}
