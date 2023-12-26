// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_storage/firebase_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:tiktoktest/src/core/common/modules/injectable_modules.dart'
    as _i30;
import 'package:tiktoktest/src/feature/home/data/datasource/spring_video_datasource_impl.dart'
    as _i8;
import 'package:tiktoktest/src/feature/home/data/datasource/video_datasource.dart'
    as _i7;
import 'package:tiktoktest/src/feature/home/data/repository/video_repository_impl.dart'
    as _i10;
import 'package:tiktoktest/src/feature/home/service/repository/video_repository.dart'
    as _i9;
import 'package:tiktoktest/src/feature/home/service/usecase/get_video_list_impl.dart'
    as _i14;
import 'package:tiktoktest/src/feature/home/service/usecase/upload_video_impl.dart'
    as _i19;
import 'package:tiktoktest/src/feature/home/service/usecase/video_usecase.dart'
    as _i13;
import 'package:tiktoktest/src/feature/home/view/state/upload_video_notifier.dart'
    as _i20;
import 'package:tiktoktest/src/feature/home/view/state/video_notifier.dart'
    as _i21;
import 'package:tiktoktest/src/feature/login/data/datasource/firebase_login_datasource_impl.dart'
    as _i12;
import 'package:tiktoktest/src/feature/login/data/datasource/login_datasource.dart'
    as _i11;
import 'package:tiktoktest/src/feature/login/data/repository/login_repository_impl.dart'
    as _i16;
import 'package:tiktoktest/src/feature/login/service/repository/login_repository.dart'
    as _i15;
import 'package:tiktoktest/src/feature/login/service/usecase/current_user_impl.dart'
    as _i22;
import 'package:tiktoktest/src/feature/login/service/usecase/google_login_usecase_impl.dart'
    as _i23;
import 'package:tiktoktest/src/feature/login/service/usecase/is_user_signed_impl.dart'
    as _i24;
import 'package:tiktoktest/src/feature/login/service/usecase/login_usecase.dart'
    as _i17;
import 'package:tiktoktest/src/feature/login/service/usecase/user_signout_impl.dart'
    as _i18;
import 'package:tiktoktest/src/feature/login/view/state/login/is_signin_user_notifier.dart'
    as _i26;
import 'package:tiktoktest/src/feature/login/view/state/login/login_user_notifier.dart'
    as _i28;
import 'package:tiktoktest/src/feature/login/view/state/login/signout_user_notifier.dart'
    as _i29;
import 'package:tiktoktest/src/feature/login/view/state/login_state.dart'
    as _i25;
import 'package:tiktoktest/src/feature/login/view/state/user/current_user_notifier.dart'
    as _i27;

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
    gh.factory<_i3.Client>(() => injectionModules.clientHttp);
    gh.factory<_i4.FirebaseAuth>(() => injectionModules.firebaseAuth);
    gh.factory<_i5.FirebaseStorage>(() => injectionModules.firebaseStorage);
    gh.factory<_i6.GoogleSignIn>(() => injectionModules.googleSignIn);
    gh.lazySingleton<_i7.SpringServiceDataSource>(
        () => _i8.SpringServiceDataSourceImpl(
              firebaseAuth: gh<_i4.FirebaseAuth>(),
              clientHttp: gh<_i3.Client>(),
            ));
    gh.lazySingleton<_i9.VideoRepository>(() => _i10.VideoRepositoryImpl(
        dataSource: gh<_i7.SpringServiceDataSource>()));
    gh.lazySingleton<_i11.FirebaseLoginDataSource>(
        () => _i12.FirebaseLoginDataSourceImpl(
              firebaseAuth: gh<_i4.FirebaseAuth>(),
              googleSignIn: gh<_i6.GoogleSignIn>(),
            ));
    gh.lazySingleton<_i13.GetVideoListFromService>(() =>
        _i14.GetVideoListFromServiceImpl(
            videoRepository: gh<_i9.VideoRepository>()));
    gh.lazySingleton<_i15.LoginRepository>(() => _i16.LoginRepositoryImpl(
        firebaseLoginDataSource: gh<_i11.FirebaseLoginDataSource>()));
    gh.lazySingleton<_i17.SignedOutUser>(
        () => _i18.SignedOutUserImpl(repository: gh<_i15.LoginRepository>()));
    gh.lazySingleton<_i13.UploadVideoFromService>(() =>
        _i19.UploadVideoFromServiceImpl(
            videoRepository: gh<_i9.VideoRepository>()));
    gh.lazySingleton<_i20.UploadVideoStateNotifierImpl>(() =>
        _i20.UploadVideoStateNotifierImpl(
            uploadVideoFromService: gh<_i13.UploadVideoFromService>()));
    gh.lazySingleton<_i21.VideoStateNotifierImpl>(() =>
        _i21.VideoStateNotifierImpl(
            getVideoListFromService: gh<_i13.GetVideoListFromService>()));
    gh.lazySingleton<_i17.GetCurrentUserProfile>(() =>
        _i22.GetCurrentUserProfileImpl(repository: gh<_i15.LoginRepository>()));
    gh.lazySingleton<_i17.GetUserProfileFromGoogle>(() =>
        _i23.GetUserProfileFromGoogleImpl(
            loginRepository: gh<_i15.LoginRepository>()));
    gh.lazySingleton<_i17.IsUserSignedIn>(
        () => _i24.IsUserSignedInImpl(repository: gh<_i15.LoginRepository>()));
    gh.lazySingleton<_i25.IsUserSignedInStateNotifier>(() =>
        _i26.IsUserSignedInStateNotifierImpl(
            userSignedIn: gh<_i17.IsUserSignedIn>()));
    gh.lazySingleton<_i25.CurrentUserStateNotifier>(() =>
        _i27.CurrentUserStateNotifierImpl(
            currentUser: gh<_i17.GetCurrentUserProfile>()));
    gh.lazySingleton<_i25.LoginUserStateNotifier>(
        () => _i28.LoginUserStateNotifierImpl(
              profileFromGoogle: gh<_i17.GetUserProfileFromGoogle>(),
              currentUserStateNotifier: gh<_i25.CurrentUserStateNotifier>(),
            ));
    gh.lazySingleton<_i25.SignedOutUserStateNotifier>(
        () => _i29.SignedOutUserStateNotifierImpl(
              signedOutUser: gh<_i17.SignedOutUser>(),
              currentUserStateNotifier: gh<_i25.CurrentUserStateNotifier>(),
            ));
    return this;
  }
}

class _$InjectionModules extends _i30.InjectionModules {}
