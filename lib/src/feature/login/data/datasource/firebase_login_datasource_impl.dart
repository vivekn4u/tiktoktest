import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:tiktoktest/src/core/util/error/failures.dart';
import 'package:tiktoktest/src/feature/login/data/datasource/login_datasource.dart';
import 'package:tiktoktest/src/feature/login/data/model/user_model.dart';
import 'package:tiktoktest/src/feature/login/service/entity/user_entity.dart';

@LazySingleton(as: FirebaseLoginDataSource)

///login datasource implementation, firebase specific
class FirebaseLoginDataSourceImpl extends FirebaseLoginDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  FirebaseLoginDataSourceImpl(
      {required this.firebaseAuth, required this.googleSignIn});

  @override
  Future<Either<Failures, UserEntity>> currentUser() {
    User? user = firebaseAuth.currentUser;
    try {
      if (user != null) {
        //convert the incoming auth data into entity using model
        UserModel entity = UserModel.fromFirebaseAuth(user);
        return Future.value(Right(entity));
      } else {
        return Future.value(
            const Left(ServerFailure(message: "User not found!!")));
      }
    } catch (e) {
      return Future.value(
          const Left(CacheFailure(message: "User not found!!")));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> getUserFromGoogleApi() async {
    UserCredential? authResult;
    try {
      //implementation specific for web
      if (kIsWeb) {
        GoogleAuthProvider authProvider = GoogleAuthProvider();

        authResult = await firebaseAuth.signInWithPopup(authProvider);
      } else {
        // Trigger the authentication flow
        final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        // Once signed in, return the UserCredential
        authResult = await firebaseAuth.signInWithCredential(credential);
      }

      final User? user = authResult.user;

      if (user != null) {
        //convert the incoming auth data into entity using model
        UserModel entity = UserModel.fromFirebaseAuth(user);
        return Future.value(Right(entity));
      } else {
        return Future.value(
            const Left(ServerFailure(message: "Google - No user found!!")));
      }
    } catch (e) {
      return Future.value(
          Left(ServerFailure(message: "Google Login Failed - $e")));
    }
  }

  @override
  Future<Either<Failures, bool>> isUserSignedIn() {
    try {
      User? currentUser = firebaseAuth.currentUser;

      if (currentUser == null) {
        return Future.value(const Right(false));
      } else {
        return Future.value(const Right(true));
      }
    } on Exception {
      return Future.value(const Left(
          CacheFailure(message: 'Error: unable to connect to the server!!')));
    }
  }

  @override
  Future<Either<Failures, bool>> signedOutUser() {
    try {
      Future.wait([firebaseAuth.signOut(), googleSignIn.signOut()]);
      return Future.value(const Right(true));
    } on Exception {
      return Future.value(const Right(false));
    }
  }
}
