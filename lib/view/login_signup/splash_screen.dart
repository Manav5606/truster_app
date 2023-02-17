import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truster_app/controller/login_controller.dart';

import '../../const/color_constants.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final LoginController controller = Get.put(LoginController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: Get.width * 0.7,
          height: Get.width * 0.7,
          child: Image.asset('assets/logo/logo.png'),
        ),
      ),
      backgroundColor: white,
    );
  }
}
