import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:tiktoktest/src/feature/home/service/usecase/video_usecase.dart';

@lazySingleton
class UploadVideoStateNotifierImpl extends StateNotifier<String> {
  UploadVideoStateNotifierImpl({required this.uploadVideoFromService})
      : super("");

  final UploadVideoFromService uploadVideoFromService;

  void uploadVideo() async {
    try {
      final picker = ImagePicker();
      File? pickedVideo;
      final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
      if (pickedFile != null) {
        pickedVideo = File(pickedFile.path);
        state = "Uploading...";

        uploadVideoFromService(VideoUploadParams(file: pickedVideo))
            ?.then((data) {
          data.fold((l) => state = "Error: ${l.message}",
              (r) => state = "File uploaded successful!!");
        });
      }
    } on Exception {
      state = "Error occurred while uploading!!";
    }
  }
}
