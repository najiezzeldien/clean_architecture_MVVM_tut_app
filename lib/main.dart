import 'package:flutter/material.dart';
import 'package:tut_app/app/di.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tut_app/presentation/resources/language_manager.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModule();
  runApp(EasyLocalization(
    supportedLocales: [
      ENGLISH_LOCAL,
      ARABIC_LOCAL,
    ],
    path: ASSETS_PATH_LOCALISATIONS,
    child: Phoenix(child: MyApp()),
  ));
}
