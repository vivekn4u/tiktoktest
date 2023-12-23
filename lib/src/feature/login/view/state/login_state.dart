import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktoktest/src/feature/login/view/state/login/login_user_state.dart';
import 'package:tiktoktest/src/feature/login/view/state/user/current_user_state.dart';

///[Marker interface] for login state notifiers
abstract class LoginStateNotifier<T> extends StateNotifier<T> {
  LoginStateNotifier(super.state);
}

abstract class CurrentUserStateNotifier
    extends LoginStateNotifier<CurrentUserState> {
  CurrentUserStateNotifier(super.state);

  notifyCurrentUser();
}

abstract class LoginUserStateNotifier
    extends LoginStateNotifier<LoginUserState> {
  LoginUserStateNotifier(super.state);

  notifyGoogleLoginUser();
}

abstract class IsUserSignedInStateNotifier extends LoginStateNotifier<bool> {
  IsUserSignedInStateNotifier(super.state);

  notifyIsUserSignedIn();
}

abstract class SignedOutUserStateNotifier extends LoginStateNotifier<bool> {
  SignedOutUserStateNotifier(super.state);

  notifyUserSignedOut();
}
