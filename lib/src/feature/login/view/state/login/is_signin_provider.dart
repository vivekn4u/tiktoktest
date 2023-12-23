import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktoktest/src/core/common/services/service_locator.dart';
import 'package:tiktoktest/src/feature/login/view/state/login_state.dart';

/// A [StateNotifierProvider] which provides [bool] to [ConsumerWidget]
///
final userSignedInProvider =
    StateNotifierProvider<IsUserSignedInStateNotifier, bool>(
        (ref) => sl<IsUserSignedInStateNotifier>());
