import 'package:flutter/material.dart';
import 'package:tiktoktest/src/feature/home/view/widgets/upload_video_button_widget.dart';
import 'package:tiktoktest/src/feature/home/view/widgets/video_list_button_button.dart';
import 'package:tiktoktest/src/feature/home/view/widgets/video_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  //route
  static const String route = "/";

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
          body: Column(children: [
        SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            VideoListButtonWidget(),
            VideoUploadButtonWidget(),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        VideoListWidget(),
      ])),
    );
  }
}
