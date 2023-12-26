import 'package:flutter/material.dart';

///Indicator to display loading progress.
///
class ProgressIndicatorWidget extends StatelessWidget {
  ///Creates a progress indicator.
  ///
  const ProgressIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      padding: const EdgeInsets.all(2.0),
      child: const CircularProgressIndicator(
        color: Colors.black,
        strokeWidth: 3,
      ),
    );
  }
}
