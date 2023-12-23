import 'package:beamer/beamer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktoktest/src/core/common/widgets/error.dart';
import 'package:tiktoktest/src/feature/home/view/pages/home_page.dart';
import 'package:tiktoktest/src/feature/home/view/widgets/location.dart';
import 'package:tiktoktest/src/feature/login/view/widgets/location.dart';

///common route delegate function for all the features
BeamerDelegate TikTokRouteDelegate(/*ProviderContainer container*/) =>
    BeamerDelegate(
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
          // BeamGuard(
          //     pathPatterns: [HomePage.route],
          //     // guardNonMatching: true,
          //     // Only allow to navigate past `home` if the `userSignedInProvider` is `true`.
          //     check: (context, state) => container.read(currentUserProvider)
          //         is CurrentUserCompletedState,
          //     beamToNamed: (_, __) => LoginPage.route),
          // BeamGuard(
          //     pathPatterns: [LoginPage.route],
          //     // guardNonMatching: true,
          //     // Only allow to navigate past `home` if the `userSignedInProvider` is `true`.
          //     check: (context, state) => container.read(currentUserProvider)
          //         is! CurrentUserCompletedState,
          //     beamToNamed: (_, __) => HomePage.route),
        ]);
