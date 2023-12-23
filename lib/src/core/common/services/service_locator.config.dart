// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:tiktoktest/src/core/common/modules/injectable_modules.dart'
    as _i19;
import 'package:tiktoktest/src/feature/login/data/datasource/firebase_login_datasource_impl.dart'
    as _i6;
import 'package:tiktoktest/src/feature/login/data/datasource/login_datasource.dart'
    as _i5;
import 'package:tiktoktest/src/feature/login/data/repository/login_repository_impl.dart'
    as _i8;
import 'package:tiktoktest/src/feature/login/service/repository/login_repository.dart'
    as _i7;
import 'package:tiktoktest/src/feature/login/service/usecase/current_user_impl.dart'
    as _i11;
import 'package:tiktoktest/src/feature/login/service/usecase/google_login_usecase_impl.dart'
    as _i12;
import 'package:tiktoktest/src/feature/login/service/usecase/is_user_signed_impl.dart'
    as _i13;
import 'package:tiktoktest/src/feature/login/service/usecase/login_usecase.dart'
    as _i9;
import 'package:tiktoktest/src/feature/login/service/usecase/user_signout_impl.dart'
    as _i10;
import 'package:tiktoktest/src/feature/login/view/state/login/is_signin_user_notifier.dart'
    as _i15;
import 'package:tiktoktest/src/feature/login/view/state/login/login_user_notifier.dart'
    as _i17;
import 'package:tiktoktest/src/feature/login/view/state/login/signout_user_notifier.dart'
    as _i18;
import 'package:tiktoktest/src/feature/login/view/state/login_state.dart'
    as _i14;
import 'package:tiktoktest/src/feature/login/view/state/user/current_user_notifier.dart'
    as _i16;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModules = _$InjectionModules();
    gh.factory<_i3.FirebaseAuth>(() => injectionModules.firebaseAuth);
    gh.factory<_i4.GoogleSignIn>(() => injectionModules.googleSignIn);
    gh.lazySingleton<_i5.FirebaseLoginDataSource>(
        () => _i6.FirebaseLoginDataSourceImpl(
              firebaseAuth: gh<_i3.FirebaseAuth>(),
              googleSignIn: gh<_i4.GoogleSignIn>(),
            ));
    gh.lazySingleton<_i7.LoginRepository>(() => _i8.LoginRepositoryImpl(
        firebaseLoginDataSource: gh<_i5.FirebaseLoginDataSource>()));
    gh.lazySingleton<_i9.SignedOutUser>(
        () => _i10.SignedOutUserImpl(repository: gh<_i7.LoginRepository>()));
    gh.lazySingleton<_i9.GetCurrentUserProfile>(() =>
        _i11.GetCurrentUserProfileImpl(repository: gh<_i7.LoginRepository>()));
    gh.lazySingleton<_i9.GetUserProfileFromGoogle>(() =>
        _i12.GetUserProfileFromGoogleImpl(
            loginRepository: gh<_i7.LoginRepository>()));
    gh.lazySingleton<_i9.IsUserSignedIn>(
        () => _i13.IsUserSignedInImpl(repository: gh<_i7.LoginRepository>()));
    gh.lazySingleton<_i14.IsUserSignedInStateNotifier>(() =>
        _i15.IsUserSignedInStateNotifierImpl(
            userSignedIn: gh<_i9.IsUserSignedIn>()));
    gh.lazySingleton<_i14.CurrentUserStateNotifier>(() =>
        _i16.CurrentUserStateNotifierImpl(
            currentUser: gh<_i9.GetCurrentUserProfile>()));
    gh.lazySingleton<_i14.LoginUserStateNotifier>(
        () => _i17.LoginUserStateNotifierImpl(
              profileFromGoogle: gh<_i9.GetUserProfileFromGoogle>(),
              currentUserStateNotifier: gh<_i14.CurrentUserStateNotifier>(),
            ));
    gh.lazySingleton<_i14.SignedOutUserStateNotifier>(
        () => _i18.SignedOutUserStateNotifierImpl(
              signedOutUser: gh<_i9.SignedOutUser>(),
              currentUserStateNotifier: gh<_i14.CurrentUserStateNotifier>(),
            ));
    return this;
  }
}

class _$InjectionModules extends _i19.InjectionModules {}
