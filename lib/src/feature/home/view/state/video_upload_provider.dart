import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktoktest/src/core/common/services/service_locator.dart';
import 'package:tiktoktest/src/feature/home/view/state/upload_video_notifier.dart';
import 'package:tiktoktest/src/feature/home/view/state/video_state.dart';

typedef VideoUploadStateProvider
    = StateNotifierProvider<UploadVideoStateNotifierImpl, String>;

/// A [StateNotifierProvider] which provides [VideoState]
/// to [ConsumerWidget].
///
final videoUploadStateProvider =
    VideoUploadStateProvider((ref) => sl<UploadVideoStateNotifierImpl>());
