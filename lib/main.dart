import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uzgaruvchi/controllers/setting_controller.dart';
import 'package:uzgaruvchi/poral/settings_portal.dart';
import 'package:uzgaruvchi/utils/app_constats.dart';
import 'package:uzgaruvchi/views/screens/home_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SettingPortal(
      settingController: SettingController(),
      child: Builder(builder: (context) {
        return ListenableBuilder(
            listenable: SettingPortal.of(context),
            builder: (context, child) {
              return ScreenUtilInit(
                designSize: const Size(100, 300),
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                      appBarTheme: AppBarTheme(
                          backgroundColor: AppConstants.appBarLight),
                      scaffoldBackgroundColor: AppConstants.bodyLight),
                  darkTheme: ThemeData(
                      appBarTheme:
                          AppBarTheme(backgroundColor: AppConstants.appBarDark),
                      scaffoldBackgroundColor: AppConstants.bodyDark),
                  themeMode: SettingPortal.of(context).themeMode,
                  home: const HomeScreen(),
                ),
              );
            });
      }),
    );
  }
}

void main(List<String> args) {
  runApp(const MyApp());
}
