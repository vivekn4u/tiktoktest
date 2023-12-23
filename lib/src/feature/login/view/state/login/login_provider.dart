import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktoktest/src/core/common/services/service_locator.dart';
import 'package:tiktoktest/src/feature/login/view/state/login/login_user_state.dart';
import 'package:tiktoktest/src/feature/login/view/state/login_state.dart';

typedef LoginUserProvider
    = StateNotifierProvider<LoginUserStateNotifier, LoginUserState>;

/// A [StateNotifierProvider] which provides [LoginUserState] to [ConsumerWidget]
///
final loginUserProvider =
    LoginUserProvider((ref) => sl<LoginUserStateNotifier>());
