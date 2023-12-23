import 'package:injectable/injectable.dart';
import 'package:tiktoktest/src/core/util/usecase/usecase.dart';
import 'package:tiktoktest/src/feature/login/service/usecase/login_usecase.dart';
import 'package:tiktoktest/src/feature/login/view/state/login_state.dart';

@LazySingleton(as: IsUserSignedInStateNotifier)

///A [StateNotifier] which notifies [bool] to [StateNotifierProvider].

///* Requires [IsUserSignedIn] use case for authentication
/// related queries.
///
class IsUserSignedInStateNotifierImpl extends IsUserSignedInStateNotifier {
  IsUserSignedInStateNotifierImpl({required this.userSignedIn}) : super(false) {
    // notifyIsUserSignedIn();
  }

  final IsUserSignedIn userSignedIn;

  @override
  notifyIsUserSignedIn() {
    try {
      state = false;
      userSignedIn(NoParams())?.then((data) {
        data.fold((l) => state = false, (r) => state = r);
      });
    } on Exception {
      state = false;
    }
  }
}
