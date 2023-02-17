import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:truster_app/const/color_constants.dart';

import 'view/login_signup/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Truster App',
      theme: ThemeData(
          primarySwatch: primaryColor,
          scaffoldBackgroundColor: white,
          
          appBarTheme: const AppBarTheme(
            backgroundColor: white,
            elevation: 0,
            foregroundColor: black,
            actionsIconTheme: IconThemeData(color: grey),
          ),),
      home: SplashScreen(),
    );
  }
}
