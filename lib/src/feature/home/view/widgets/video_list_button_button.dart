import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tiktoktest/src/core/common/services/service_locator.dart';
import 'package:tiktoktest/src/feature/home/view/state/video_notifier.dart';

class VideoListButtonWidget extends HookWidget {
  const VideoListButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loading = useState(false);

    return IconButton(
      icon: const Icon(
        Icons.video_library,
        weight: 25,
      ),
      onPressed: loading.value
          ? null
          : () {
              loading.value = true;
              sl<VideoStateNotifierImpl>()
                  .getVideoList("http://localhost:8083/api/video");
              loading.value = false;
            },
    );
  }
}
