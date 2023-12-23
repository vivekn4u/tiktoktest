import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:tiktoktest/src/feature/home/view/pages/home_page.dart';
import 'package:tiktoktest/src/feature/login/view/pages/login_page.dart';

///Login page navigation logic will be displayed here
class LoginLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      if (state.uriBlueprint.toString() == LoginPage.route)
        const BeamPage(
            child: LoginPage(), title: "Login", key: ValueKey(LoginPage.route)),
      if (state.uriBlueprint.toString() == HomePage.route)
        const BeamPage(
            child: HomePage(), title: "Home", key: ValueKey(HomePage.route)),
    ];

    return pages;
  }

  @override
  List<Pattern> get pathPatterns => [LoginPage.route, HomePage.route];
}
