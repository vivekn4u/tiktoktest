import 'package:injectable/injectable.dart';
import 'package:tiktoktest/src/core/util/usecase/usecase.dart';
import 'package:tiktoktest/src/feature/login/service/usecase/login_usecase.dart';
import 'package:tiktoktest/src/feature/login/view/state/login_state.dart';

@LazySingleton(as: SignedOutUserStateNotifier)

///A [StateNotifier] which notifies [bool] to [StateNotifierProvider].

///* Requires [SignedOutUser] use case for authentication
/// related queries.
///
class SignedOutUserStateNotifierImpl extends SignedOutUserStateNotifier {
  SignedOutUserStateNotifierImpl(
      {required this.signedOutUser, required this.currentUserStateNotifier})
      : super(false);

  final SignedOutUser signedOutUser;
  final CurrentUserStateNotifier currentUserStateNotifier;

  @override
  notifyUserSignedOut() {
    try {
      state = false;
      signedOutUser(NoParams())?.then((data) {
        data.fold((l) => state = false, (r) {
          if (r) {
            currentUserStateNotifier.notifyCurrentUser();
          }
          state = r;
        });
      });
    } on Exception {
      state = false;
    }
  }
}
