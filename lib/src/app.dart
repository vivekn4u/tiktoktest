import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktoktest/src/core/common/logic/route_delegets.dart';
import 'package:tiktoktest/src/core/common/settings/settings_controller.dart';
import 'package:tiktoktest/src/core/common/widgets/error.dart';
import 'package:tiktoktest/src/feature/home/view/pages/home_page.dart';
import 'package:tiktoktest/src/feature/home/view/widgets/location.dart';
import 'package:tiktoktest/src/feature/login/view/pages/login_page.dart';
import 'package:tiktoktest/src/feature/login/view/state/user/current_user_provider.dart';
import 'package:tiktoktest/src/feature/login/view/state/user/current_user_state.dart';
import 'package:tiktoktest/src/feature/login/view/widgets/location.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.

    BeamerDelegate TiktokRouteDelegate = BeamerDelegate(
        initialPath: '/',
        notFoundPage: const BeamPage(
            child: ErrorPage(
          message: 'Page Not found!!',
        )),
        //add your route locations here as per your features
        locationBuilder: BeamerLocationBuilder(beamLocations: [
          //Home page location
          HomeLocation(),
          LoginLocation(),
        ]),
        guards: [
          BeamGuard(
              pathPatterns: [HomePage.route],
              // guardNonMatching: true,
              // Only allow to navigate past `home` if the `userSignedInProvider` is `true`.
              check: (context, state) {
                final container =
                    ProviderScope.containerOf(context, listen: false);
                return container.read(currentUserProvider)
                    is CurrentUserCompletedState;
              },

              // check: (context, state) => container.read(currentUserProvider)
              //     is CurrentUserCompletedState,
              beamToNamed: (_, __) => LoginPage.route),
          BeamGuard(
              pathPatterns: [LoginPage.route],
              // guardNonMatching: true,
              // Only allow to navigate past `home` if the `userSignedInProvider` is `true`.

              check: (context, state) {
                final container =
                    ProviderScope.containerOf(context, listen: false);
                return container.read(currentUserProvider)
                    is! CurrentUserCompletedState;
              },

              // check: (context, state) => container.read(currentUserProvider)
              //     is! CurrentUserCompletedState,
              beamToNamed: (_, __) => HomePage.route),
        ]);

    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          // onGenerateRoute: (RouteSettings routeSettings) {
          //   return MaterialPageRoute<void>(
          //     settings: routeSettings,
          //     builder: (BuildContext context) {
          //       switch (routeSettings.name) {
          //         case SettingsView.routeName:
          //           return SettingsView(controller: settingsController);
          //         case SampleItemDetailsView.routeName:
          //           return const SampleItemDetailsView();
          //         case SampleItemListView.routeName:
          //         default:
          //           return const SampleItemListView();
          //       }
          //     },
          //   );
          // },
          routeInformationParser: BeamerParser(),
          routerDelegate: TiktokRouteDelegate,
        );
      },
    );
  }
}
