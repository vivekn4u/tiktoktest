import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktoktest/src/feature/login/view/state/login/login_provider.dart';
import 'package:tiktoktest/src/feature/login/view/state/login/login_user_state.dart';
import 'package:tiktoktest/src/feature/login/view/widgets/login_button_widget.dart';

class LoginFormWidget extends ConsumerWidget {
  final LoginUserProvider _loginProvider;

  ///Creates a login form.
  ///
  LoginFormWidget({
    super.key,
    LoginUserProvider? testLoginUserProvider,
  }) : _loginProvider = testLoginUserProvider ?? loginUserProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(_loginProvider);

    if (authState is LoginUserCompletedState) {
      Beamer.of(context).beamToNamed("/");
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LoginButtonWidget(
          label: 'Google',
          image: "assets/images/Google.png",
          onPressed: () {
            ref.read(_loginProvider.notifier).notifyGoogleLoginUser();
            Beamer.of(context).update();
          },
        ),
      ],
    );
  }
}
