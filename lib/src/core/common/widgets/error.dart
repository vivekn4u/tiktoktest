import 'package:flutter/material.dart';

///common error page for application
class ErrorPage extends StatelessWidget {
  final String? message;
  const ErrorPage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Center(
            child: Text(
              message!,
              style: const TextStyle(color: Colors.red),
            ),
          )),
    );
  }
}
