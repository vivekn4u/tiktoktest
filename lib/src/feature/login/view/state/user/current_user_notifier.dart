import 'package:injectable/injectable.dart';
import 'package:tiktoktest/src/core/util/error/failures.dart';
import 'package:tiktoktest/src/core/util/usecase/usecase.dart';
import 'package:tiktoktest/src/feature/login/service/usecase/login_usecase.dart';
import 'package:tiktoktest/src/feature/login/view/state/login_state.dart';
import 'package:tiktoktest/src/feature/login/view/state/user/current_user_state.dart';

@LazySingleton(as: CurrentUserStateNotifier)

///A [StateNotifier] which notifies [ResetPasswordState] to [CurrentUserState]
///for the app
///
///* Requires [GetCurrentUserProfile] use case for user authentication
/// related queries.
///
class CurrentUserStateNotifierImpl extends CurrentUserStateNotifier {
  CurrentUserStateNotifierImpl({required this.currentUser})
      : super(CurrentUserInitialState()) {
    notifyCurrentUser();
  }

  final GetCurrentUserProfile currentUser;

  @override
  notifyCurrentUser() {
    try {
      state = CurrentUserLoadingState();
      currentUser(NoParams())?.then((data) {
        data.fold((l) => state = CurrentUserErrorState(failures: l),
            (r) => state = CurrentUserCompletedState(currentUser: r));
      });
    } on Exception {
      state = CurrentUserErrorState(
          failures: const ServerFailure(message: "Error: User Not Found!!"));
    }
  }
}
