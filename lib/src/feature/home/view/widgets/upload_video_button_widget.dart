import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tiktoktest/src/core/common/services/service_locator.dart';
import 'package:tiktoktest/src/core/common/widgets/progress_bar.dart';
import 'package:tiktoktest/src/feature/home/view/state/upload_video_notifier.dart';
import 'package:tiktoktest/src/feature/home/view/state/video_upload_provider.dart';

class VideoUploadButtonWidget extends HookConsumerWidget {
  const VideoUploadButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uploadVideoProvider = ref.watch(videoUploadStateProvider);

    if (uploadVideoProvider == "File uploaded successfully!!") {
      Timer.periodic(Duration.zero, (timer) {
        final snackBar = SnackBar(content: Text(uploadVideoProvider));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }

    return uploadVideoProvider == "Uploading..."
        ? const ProgressIndicatorWidget()
        : IconButton(
            icon: const Icon(
              Icons.upload_file,
              weight: 25,
            ),
            onPressed: uploadVideoProvider == "Uploading..."
                ? null
                : () {
                    sl<UploadVideoStateNotifierImpl>().uploadVideo();
                  },
          );
  }
}
