
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'app/app.dart';

void main()async{
  AndroidYandexMap.useAndroidViewSurface = false;
  WidgetsFlutterBinding.ensureInitialized();
  await  EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('uz', 'UZ'),
        Locale('uz', 'UZKrill'),
        Locale('ru', 'RU'),
      ],
      path: 'assets/translate',
      fallbackLocale: const Locale('uz', 'UZ'),
      child: const App(),
    ),
  );
}