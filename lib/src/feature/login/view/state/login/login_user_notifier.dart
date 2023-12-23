import 'package:injectable/injectable.dart';
import 'package:tiktoktest/src/core/util/error/failures.dart';
import 'package:tiktoktest/src/core/util/usecase/usecase.dart';
import 'package:tiktoktest/src/feature/login/service/usecase/login_usecase.dart';
import 'package:tiktoktest/src/feature/login/view/state/login/login_user_state.dart';
import 'package:tiktoktest/src/feature/login/view/state/login_state.dart';

enum AuthStatus { loading, authenticated, unauthenticated }

@LazySingleton(as: LoginUserStateNotifier)

///A [StateNotifier] which notifies [LoginUserState] to [StateNotifierProvider]
///for 'login user' UI.
class LoginUserStateNotifierImpl extends LoginUserStateNotifier {
  /// Creates and instance of [LoginUserStateNotifier].
  ///
  final GetUserProfileFromGoogle profileFromGoogle;
  final CurrentUserStateNotifier currentUserStateNotifier;

  LoginUserStateNotifierImpl({
    required this.profileFromGoogle,
    required this.currentUserStateNotifier,
  }) : super(LoginUserInitialState()) {
    //notifyCurrentUser();
  }

  @override
  notifyGoogleLoginUser() {
    try {
      state = LoginUserLoadingState();
      profileFromGoogle(NoParams())?.then((data) {
        data.fold((l) => state = LoginUserErrorState(failures: l), (r) {
          currentUserStateNotifier.notifyCurrentUser();
          state = LoginUserCompletedState(loginUser: r);
        });
      });
    } on Exception {
      state = LoginUserErrorState(
          failures: const ServerFailure(message: "Error: User Not Found!!"));
    }
  }
}
