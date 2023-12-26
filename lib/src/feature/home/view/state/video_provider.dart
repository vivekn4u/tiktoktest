import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktoktest/src/core/common/services/service_locator.dart';
import 'package:tiktoktest/src/feature/home/view/state/video_notifier.dart';
import 'package:tiktoktest/src/feature/home/view/state/video_state.dart';

typedef VideoStateProvider
    = StateNotifierProvider<VideoStateNotifierImpl, VideoState>;

/// A [StateNotifierProvider] which provides [VideoState]
/// to [ConsumerWidget].
///
final videoStateProvider =
    VideoStateProvider((ref) => sl<VideoStateNotifierImpl>());
