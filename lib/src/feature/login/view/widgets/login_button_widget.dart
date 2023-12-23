import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tiktoktest/src/core/common/widgets/progress_bar.dart';
import 'package:tiktoktest/src/feature/login/view/state/user/current_user_provider.dart';
import 'package:tiktoktest/src/feature/login/view/state/user/current_user_state.dart';

///A button for fedrated authenticated provider.
///
///Button has an image to display authentication provider logo.
///
///Requires:
///* [CurrentUserProvider] to monitor authentication state of the app.
class LoginButtonWidget extends HookConsumerWidget {
  final CurrentUserProvider _provider;

  ///function to execute when the button is pressed.
  final void Function()? onPressed;

  ///Label of the button.
  final String label;

  ///path to the image to be displayed as icon.
  final String image;

  ///horizontal inset padding of the button.
  final double horizontalPadding;

  ///Create a login button with given label and image.
  ///
  /// * [horizontalPadding] can be adjusted as required.
  ///
  LoginButtonWidget({
    super.key,
    required this.onPressed,
    required this.label,
    required this.image,
    this.horizontalPadding = 55,
    CurrentUserProvider? testCurrentUserProvider,
  }) : _provider = testCurrentUserProvider ?? currentUserProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(_provider);
    final isLoading = useState(false);

    if (currentUser is CurrentUserCompletedState) {
      isLoading.value = false;
      Future.delayed(Duration.zero, () {
        context.beamToNamed("/");
      });
    }

    return ElevatedButton.icon(
      key: const Key('login_button'),
      onPressed: isLoading.value
          ? null
          : () {
              isLoading.value = true;
              onPressed?.call();
            },
      icon: Image.asset(image, width: 25),
      label: isLoading.value
          ? const ProgressIndicatorWidget()
          : Text(
              "Continue with $label",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
      style: TextButton.styleFrom(
        padding:
            EdgeInsets.symmetric(vertical: 15, horizontal: horizontalPadding),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }
}
