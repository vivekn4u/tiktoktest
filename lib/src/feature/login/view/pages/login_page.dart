import 'package:flutter/material.dart';
import 'package:tiktoktest/src/feature/login/view/widgets/login_form_widget.dart';

class LoginPage extends StatelessWidget {
  //route
  static const String route = "/login";

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: LoginFormWidget(),
    ));
  }
}
