import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:tiktoktest/src/feature/home/view/pages/home_page.dart';

///Home page navigation logic will be displayed here
class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      if (state.uriBlueprint.toString() == HomePage.route)
        const BeamPage(
            child: HomePage(), title: "Home", key: ValueKey(HomePage.route)),
    ];

    return pages;
  }

  @override
  List<Pattern> get pathPatterns => [HomePage.route];
}
