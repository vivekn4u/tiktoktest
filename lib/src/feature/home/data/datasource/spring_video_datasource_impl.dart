import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:tiktoktest/src/core/util/error/failures.dart';
import 'package:tiktoktest/src/feature/home/data/datasource/video_datasource.dart';
import 'package:tiktoktest/src/feature/home/service/entity/video_entity.dart';

@LazySingleton(as: SpringServiceDataSource)

///
class SpringServiceDataSourceImpl extends SpringServiceDataSource {
  final FirebaseAuth firebaseAuth;
  final http.Client clientHttp;

  SpringServiceDataSourceImpl(
      {required this.firebaseAuth, required this.clientHttp});

  @override
  Future<Either<Failures, VideoEntity>> getListOfVideos(
      VideoEntity entity) async {
    try {
      Uri url = Uri.parse(entity.serviceUrl!);
      User? user = firebaseAuth.currentUser;
      String? token = await user?.getIdToken() ?? "";
      // var request =
      //     await http.get(url, headers: {"Authorization": "Bearer $token"});
      // var response = await clientHttp.send(request.request!);
      // var response = await clientHttp.send(request.);
      return await http.get(url,
          headers: {"Authorization": "Bearer $token"}).then((response) async {
        if (response.statusCode == 200) {
          // List<dynamic> responseData = json.decode(response.body);
          List<dynamic> videoDataList = jsonDecode(response.body);
          Map<String, dynamic> videoMap = {};
          for (Map<String, dynamic> video in videoDataList) {
            videoMap[video['name']] = video['url'];
          }

          // String tLink = responseData['link'];
          return Future.value(Right(entity.copyWith(videoList: videoMap)!));
        } else {
          return Future.value(
              const Left(ServerFailure(message: "Unauthorized Access!!")));
        }
      });
    } catch (error) {
      return Future.value(Left(CacheFailure(message: "${error.toString()}!!")));
    }
  }

  @override
  Future<Either<Failures, String>> uploadVideos(File file) async {
    try {
      Uri url = Uri.parse("http://localhost:8083/api/upload");
      User? user = firebaseAuth.currentUser;
      String? token = await user?.getIdToken() ?? "";

      var request = http.MultipartRequest("POST", url);
      request.files.add(http.MultipartFile.fromBytes(
          'file', file.readAsBytesSync(),
          filename: file.path.split('/').last)); // Use 'file' as field name

      var response = await request.send();
      if (response.statusCode == 200) {
        // Handle successful upload
        return Future.value(const Right("File uploaded successfully!!"));
      } else {
        // Handle upload error
        return Future.value(
            const Left(ServerFailure(message: "Server error occured!!")));
      }
    } catch (error) {
      return Future.value(Left(CacheFailure(message: "${error.toString()}!!")));
    }
  }
}
