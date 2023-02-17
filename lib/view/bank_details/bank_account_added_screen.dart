import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truster_app/const/color_constants.dart';

import '../../const/theme_const.dart';
import '../../controller/account_controller.dart';

class BankAccountAddedScreen extends StatelessWidget {
  BankAccountAddedScreen({Key? key}) : super(key: key);
  final AccountController accountController = AccountController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text(
          'Add Bank Details',
          style: appBarTextStyle,
        ),
      ),*/
      body: Obx(
        () => SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/done.png',
                  height: Get.width * 0.30,
                ),
                const Text(
                  'Bank account added',
                  style: primaryHeader2TextStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                const Text(
                  'Account details',
                  style: primaryHeader3TextStyle,
                ),
                const SizedBox(height: 15),
                const Text(
                  'Full Name',
                  style: textLabelTextStyle,
                ),
                const SizedBox(height: 5),
                Text(
                  accountController.bankDetails.value!.fullName,
                  style: detailsTextStyle,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Name of Bank',
                  style: textLabelTextStyle,
                ),
                const SizedBox(height: 5),
                Text(
                  accountController.bankDetails.value!.bankName,
                  style: detailsTextStyle,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Account#',
                  style: textLabelTextStyle,
                ),
                const SizedBox(height: 5),
                Text(
                  accountController.bankDetails.value!.accountNumber,
                  style: detailsTextStyle,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Routing#',
                  style: textLabelTextStyle,
                ),
                const SizedBox(height: 5),
                Text(
                  accountController.bankDetails.value!.routingNo,
                  style: detailsTextStyle,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // controller.signup();
                    Get.back();
                  },
                  style: buttonStylePrimary,
                  child: const Text('Return to home'),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
