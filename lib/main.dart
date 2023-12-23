import 'package:flutter/material.dart';
import 'package:tiktoktest/src/core/common/services/service_locator.dart';
import 'package:tiktoktest/src/core/common/settings/settings_controller.dart';
import 'package:tiktoktest/src/core/common/settings/settings_service.dart';

import 'src/app.dart';

void main() async {
  //Initialize widget binding
  WidgetsFlutterBinding.ensureInitialized();
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  //configure the resource locator
  configureDependencies();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController));
}
