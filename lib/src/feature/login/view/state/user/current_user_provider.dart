import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktoktest/src/core/common/services/service_locator.dart';
import 'package:tiktoktest/src/feature/login/view/state/login_state.dart';
import 'package:tiktoktest/src/feature/login/view/state/user/current_user_state.dart';

typedef CurrentUserProvider
    = StateNotifierProvider<CurrentUserStateNotifier, CurrentUserState>;

/// A [StateNotifierProvider] which provides [CurrentUserState]
/// to [ConsumerWidget].
///
final currentUserProvider =
    CurrentUserProvider((ref) => sl<CurrentUserStateNotifier>());
