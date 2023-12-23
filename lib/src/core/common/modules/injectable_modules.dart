import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectionModules {
  /// injecting 3rd party libraries

  @injectable
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @injectable
  GoogleSignIn get googleSignIn => GoogleSignIn(
        scopes: ['email'],
      );
}
