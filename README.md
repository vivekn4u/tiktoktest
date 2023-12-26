# tiktoktest

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application that follows the
[simple app state management
tutorial](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple).

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

## Localization

This project generates localized messages based on arb files found in
the `lib/src/localization` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)

# Compile and run Flutter Project

## run build runner to to generate service location file

```
flutter pub get
flutter packages pub run build_runner build
flutter run
```

## run spring boot service

```
cd services\spting-video-service
mvn spring-boot:run
```

## test spring boot service - it will require 2 postman api

### 1 -  firebase token generation url
```
POST: https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=AIzaSyCsn55zWzsNAs8JT67VcGpmW4-5vpA2sCE
\body:{"email":"user@test.com","password":"test12345","returnSecureToken":true}
```

### 2 -  test api with bearar token generated by #1

```
GET: http://localhost:8083/api/video
\Auth:{"beared": {idtoken generated by #1}}
```

#Note -
Make sure to replace localhost with proper ip where the service is running or else the features will not work! 
