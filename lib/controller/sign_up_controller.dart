import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:truster_app/view/login_signup/accout_created_screen.dart';
import 'package:truster_app/view/login_signup/signup_otp_verification_screen.dart';
import 'package:truster_app/view/login_signup/ssn_verification_screen.dart';

import '../view/login_signup/login_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get to => Get.find();
  RxBool showPassword = RxBool(false);
  RxBool showConfirmPassword = RxBool(false);
  RxBool showMobileError = RxBool(false);
  RxBool showDLImageError = RxBool(false);
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> ssnVerificationFormKey = GlobalKey<FormState>();
  TextEditingController usernameText = TextEditingController();
  TextEditingController emailText = TextEditingController();
  TextEditingController phoneNumberText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  TextEditingController confirmPasswordText = TextEditingController();
  TextEditingController nameText = TextEditingController();
  TextEditingController ssnNumberText = TextEditingController();
  TextEditingController dobText = TextEditingController();
  TextEditingController dlFileNameText = TextEditingController();
  RxBool loggingIn = RxBool(false);
  RxBool verifyingOTP = RxBool(false);
  RxBool detailsNotFoundError = RxBool(false);
  RxBool verificationCodeSent = RxBool(false);
  RxList countryLists = RxList.empty();
  RxString selectedCountryCode = RxString('');
  Rx<DateTime> selectedDOB = Rx(DateTime.now());
  final DateFormat dateFormat = DateFormat('dd-MM-yyyy');
  File? dlImageFile;
  Timer? resendCodeTimer;
  RxInt resentTimeCountdown = RxInt(120);

  @override
  void onInit() {
    super.onInit();
    getCountryList();
  }

  getCountryList() async {
    countryLists.clear();
    countryLists.addAll(['US', 'UK', 'IN']);
    selectedCountryCode.value = countryLists[0];
    print(countryLists.toString());
    print(selectedCountryCode.value);
  }

  void signup() async {
    if (signUpFormKey.currentState!.validate()) {
      Get.to(() => SSNVerificationScreen());
    }
  }

  validateMobile() async {
    if (phoneNumberText.text == '') {
      showMobileError(true);
    } else {
      showMobileError(false);
    }
  }

  void goToLoginScreen() async {
    Get.off(() => LoginScreen());
  }

  String? validateConfirmPassword(String? value) {
    String? error;
    if (value != passwordText.text) {
      error = 'Password didn\'t match';
    }
    return error;
  }

  selectDOB(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
        context: context, initialDate: selectedDOB.value, firstDate: DateTime(1900), lastDate: DateTime.now());
    if (selectedDate != null) {
      selectedDOB.value = selectedDate;
      dobText.text = dateFormat.format(selectedDate);
    }
  }

  selectDlImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      dlImageFile = File(image.path);
      dlFileNameText.text = image.name;
    }
  }

  validateDLImage() async {
    if (dlImageFile == null || dlFileNameText.text != dlImageFile!.path.split('/').last) {
      showDLImageError(true);
    } else {
      showDLImageError(false);
    }
  }

  verifySSNNumber() async {
    if (ssnVerificationFormKey.currentState!.validate()) {
      Get.to(() => SignupOtpVerificationScreen());
    }
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
   Get.offAll(()=>const AccountCreatedScreen());
  }

}
