import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do/db/db_helper.dart';
import 'package:to_do/features/board_screen/presentation/pages/board_screen.dart';
import 'package:to_do/core/theme.dart';
import 'package:to_do/services/theme_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await DBHelper.initdb();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light().copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Themes.light.primaryColor,
      )),
      darkTheme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Themes.dark.primaryColor,
      )),
      themeMode: ThemeServices().theme,
      debugShowCheckedModeBanner: false,
      home: const BoardScreen(),
    );
  }
}
