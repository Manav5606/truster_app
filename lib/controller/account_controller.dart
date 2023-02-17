import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truster_app/view/bank_details/add_bank_details_screen.dart';

import '../modal/bank_detail.dart';
import '../view/bank_details/bank_account_added_screen.dart';

class AccountController extends GetxController {
  static AccountController get to => Get.find();
  TextEditingController nameText = TextEditingController();
  TextEditingController bankNameText = TextEditingController();
  TextEditingController accNoText = TextEditingController();
  TextEditingController accNoReenterText = TextEditingController();
  TextEditingController routingNoText = TextEditingController();
  RxBool showAccountNo = RxBool(false);
  RxBool showAccountNo2 = RxBool(false);
  GlobalKey<FormState> addBankAccFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> editBankAccFormKey = GlobalKey<FormState>();
  RxBool editBankDetails=RxBool(false);

  Rx<BankDetail?> bankDetails = Rx(null);

  void goToAddBankDetailsScreen() async {
    Get.to(() => AddBankDetailsScreen());
  }

  void submitAccountDetails() async {
    if (addBankAccFormKey.currentState!.validate()) {
      bankDetails.value = BankDetail('id', nameText.text, bankNameText.text, accNoText.text, routingNoText.text);
      Get.off(() => BankAccountAddedScreen());
    }
  }void editAccountDetails() async {
    if (editBankAccFormKey.currentState!.validate()) {
      bankDetails.value = BankDetail('id', nameText.text, bankNameText.text, accNoText.text, routingNoText.text);
      editBankDetails.toggle();
    }
  }
}
