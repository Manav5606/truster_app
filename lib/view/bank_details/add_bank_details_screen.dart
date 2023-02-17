import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/theme_const.dart';
import '../../controller/account_controller.dart';

class AddBankDetailsScreen extends StatelessWidget {
  AddBankDetailsScreen({Key? key}) : super(key: key);
  final AccountController accountController = AccountController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Bank Details',
          style: appBarTextStyle,
        ),
      ),
      body: Obx(
        () => SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Form(
            key: accountController.addBankAccFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Full Name*',
                  style: textLabelTextStyle,
                ),
                const SizedBox(height: 5),
                TextFormField(
                  decoration: const InputDecoration(border: OutlineInputBorder()),
                  controller: accountController.nameText,
                  validator: (value) {
                    if (value == '') {
                      return 'Please enter Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Name of Bank*',
                  style: textLabelTextStyle,
                ),
                const SizedBox(height: 5),
                TextFormField(
                  decoration: const InputDecoration(border: OutlineInputBorder()),
                  controller: accountController.bankNameText,
                  validator: (value) {
                    if (value == '') {
                      return 'Please enter Bank name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Account#*',
                  style: textLabelTextStyle,
                ),
                const SizedBox(height: 5),
                TextFormField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: () {
                            accountController.showAccountNo.toggle();
                          },
                          icon: Icon(
                              accountController.showAccountNo.value ? Icons.visibility_outlined : Icons.visibility_off_outlined))),
                  obscureText: !accountController.showAccountNo.value,
                  controller: accountController.accNoText,
                  validator: (value) {
                    if (value == '') {
                      return 'Please enter Account number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Reenter Account#*',
                  style: textLabelTextStyle,
                ),
                const SizedBox(height: 5),
                TextFormField(
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: () {
                            accountController.showAccountNo2.toggle();
                          },
                          icon: Icon(
                              accountController.showAccountNo2.value ? Icons.visibility_outlined : Icons.visibility_off_outlined))),
                  obscureText: !accountController.showAccountNo2.value,
                  controller: accountController.accNoReenterText,
                  validator: (value) {
                    if (value == '') {
                      return 'Please reenter Account number';
                    } else if (value != accountController.accNoText.text) {
                      return 'Account# didn\'t match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Routing#*',
                  style: textLabelTextStyle,
                ),
                const SizedBox(height: 5),
                TextFormField(
                  decoration: const InputDecoration(border: OutlineInputBorder()),
                  controller: accountController.routingNoText,
                  validator: (value) {
                    if (value == '') {
                      return 'Please enter Routing number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // controller.signup();
                    accountController.submitAccountDetails();
                  },
                  style: buttonStylePrimary,
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
