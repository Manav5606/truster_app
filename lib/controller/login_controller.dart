import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truster_app/view/login_signup/forgot_password_screen.dart';
import 'package:truster_app/view/home/home_screen.dart';
import 'package:truster_app/view/login_signup/login_screen.dart';
import 'package:truster_app/view/login_signup/reset_password_screen.dart';


import '../view/login_signup/on_boarding_screen.dart';
import '../view/login_signup/sign_up_screen.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();
  RxBool showPassword=RxBool(false);
  RxBool showResetPassword=RxBool(false);
  RxBool showResetConfirmPassword=RxBool(false);
  GlobalKey<FormState> loginFormKey=GlobalKey<FormState>();
  TextEditingController emailText=TextEditingController();
  TextEditingController passwordText=TextEditingController();
  TextEditingController resetPasswordText=TextEditingController();
  TextEditingController resetConfirmPasswordText=TextEditingController();
  RxBool loggingIn =RxBool(false);
  RxBool userNotFoundError=RxBool(false);

  //Forgot Password
  RxBool verificationCodeSent = RxBool(false);
  RxString selectedCountryCode = RxString('');
  RxList countryLists = RxList.empty();
  TextEditingController phoneNumberText = TextEditingController();
  RxBool showMobileError = RxBool(false);
  Timer? resendCodeTimer;
  RxInt resentTimeCountdown = RxInt(120);
  RxBool verifyingOTP = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  void checkLogin()async{
    await Future.delayed(const Duration(seconds: 3));
    Get.offAll(()=> OnBoardingScreen());
  }
  void goToLoginScreen(bool fromOnBoarding)async{
    if(fromOnBoarding) {
      Get.to(()=> LoginScreen());
    }else{Get.off(()=> LoginScreen());}
  }
  void goToSignUpScreen(bool fromOnBoarding)async{
    if(fromOnBoarding) {
      Get.to(()=>SignUpScreen());
    }else{Get.off(()=>SignUpScreen());}
  }
  void login()async{
    if(loginFormKey.currentState!.validate()){
      loggingIn(true);
      await Future.delayed(const Duration(seconds: 2));
      loggingIn(false);
      Get.offAll(()=>HomeScreen());
      // userNotFoundError(true);
    }
  }


  //Forgot Password screen
  validateMobile() async {
    if (phoneNumberText.text == '') {
      showMobileError(true);
    } else {
      showMobileError(false);
    }
  }
  getCountryList() async {
    countryLists.clear();
    countryLists.addAll(['US', 'UK', 'IN']);
    selectedCountryCode.value = countryLists[0];
    print(countryLists.toString());
    print(selectedCountryCode.value);
  }

  sendVerificationCode() async {
    verificationCodeSent(true);
    resentTimeCountdown.value=120;
    resendCodeTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resentTimeCountdown.value > 0) {
        resentTimeCountdown--;
      } else {
        resendCodeTimer!.cancel();
      }
    });
  }
  resendVerificationCode() async {
    verificationCodeSent(true);
    resentTimeCountdown.value=120;
    resendCodeTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resentTimeCountdown.value > 0) {
        resentTimeCountdown--;
      } else {
        resendCodeTimer!.cancel();
      }
    });
  }
  verifyOTP()async{
    verifyingOTP(true);
    await Future.delayed(const Duration(seconds: 2));
    verifyingOTP(false);
    Get.off(()=> ResetPasswordScreen());
  }
  goToForgotPassword()async{
    getCountryList();
    Get.to(()=>ForgotPasswordScreen());
  }
  String? validateConfirmPassword(String? value) {
    String? error;
    if (value != passwordText.text) {
      error = 'Password didn\'t match';
    }
    return error;
  }
}
