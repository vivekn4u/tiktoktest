import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  //route
  static const String route = "/";

  @override
  Widget build(BuildContext context) {
    ///TODO: Home page logic
    return const Scaffold(body: Center(child: Text("Home Page")));
  }
}
