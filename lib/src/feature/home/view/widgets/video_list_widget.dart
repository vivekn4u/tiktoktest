import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tiktoktest/src/core/common/services/service_locator.dart';
import 'package:tiktoktest/src/core/common/widgets/progress_bar.dart';
import 'package:tiktoktest/src/feature/home/view/state/video_notifier.dart';
import 'package:tiktoktest/src/feature/home/view/state/video_provider.dart';
import 'package:tiktoktest/src/feature/home/view/state/video_state.dart';
import 'package:tiktoktest/src/feature/home/view/widgets/video_player.dart';

class VideoListWidget extends ConsumerWidget {
  const VideoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // get a list of videos
    final videos = ref.watch(videoStateProvider);

    if (videos is VideoStateLoadingState) {
      return const Center(child: ProgressIndicatorWidget());
    } else if (videos is VideoStateErrorState) {
      return Center(child: Text(videos.failures.message!));
    } else if (videos is VideoStateCompletedState) {
      return Expanded(
        child: ListView.builder(
            itemCount: videos.entity!.videoList!.length,
            itemBuilder: (context, index) {
              MapEntry<String, dynamic> entry =
                  videos.entity!.videoList!.entries.elementAt(index);
              return ListTile(
                title: Text(entry.key),
                subtitle: Text(entry.value.toString()),
                leading: const Icon(Icons.video_file),
                trailing: ElevatedButton.icon(
                  key: Key('Play_$index'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PortraitVideoPlayer(
                                networkUrl: entry.value.toString(),
                              )),
                    );
                    // sl<VideoStateNotifierImpl>()
                    //     .getVideoList("http://localhost:8083/api/video");
                  },
                  icon: const Icon(
                    Icons.play_arrow_rounded,
                    weight: 25,
                  ),
                  label: const Text('Play'),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ),
              );
            }),
      );
    } else {
      return const Center(child: Text("Load the Video list!!"));
    }
  }
}
