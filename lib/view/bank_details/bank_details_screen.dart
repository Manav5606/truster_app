import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truster_app/controller/account_controller.dart';

import '../../const/color_constants.dart';
import '../../const/theme_const.dart';
import '../../widget/bottom_app_bar.dart';

class BankDetailsScreen extends StatelessWidget {
  BankDetailsScreen({Key? key}) : super(key: key);
  final AccountController accountController = AccountController.to;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Bank Details',
            style: appBarTextStyle,
          ),
          actions: [
            if (!accountController.editBankDetails.value)
              TextButton(
                  onPressed: () {
                    accountController.editBankDetails.toggle();
                  },
                  child: const Text('Edit'))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: const CustomBottomAppBar(index: 2),
        body: SingleChildScrollView(
          child: Obx(() => accountController.bankDetails.value == null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 50),
                  child: Column(
                    children: [
                      const Text(
                        'You don’t have any bank account linked with Truter. Add now to do transactions',
                        style: detailsTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      TextButton(
                        onPressed: () {
                          accountController.goToAddBankDetailsScreen();
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DottedBorder(
                              color: primary,
                              radius: const Radius.circular(4),
                              borderType: BorderType.RRect,
                              dashPattern: const [5],
                              child: const Icon(
                                Icons.account_balance_outlined,
                                color: primary,
                              ),
                            ),
                            const Text('Add bank account details')
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                  child: !accountController.editBankDetails.value
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 20),
                            const Text(
                              'Full Name',
                              style: textLabelTextStyle,
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              enabled: false,
                              decoration: const InputDecoration(border: OutlineInputBorder(), filled: true),
                              initialValue: accountController.bankDetails.value!.fullName,
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Name of Bank',
                              style: textLabelTextStyle,
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              enabled: false,
                              decoration: const InputDecoration(border: OutlineInputBorder(), filled: true),
                              initialValue: accountController.bankDetails.value!.bankName,
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Account#',
                              style: textLabelTextStyle,
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              enabled: false,
                              decoration: const InputDecoration(border: OutlineInputBorder(), filled: true),
                              initialValue: accountController.bankDetails.value!.accountNumber,
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Routing#',
                              style: textLabelTextStyle,
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              enabled: false,
                              decoration: const InputDecoration(border: OutlineInputBorder(), filled: true),
                              initialValue: accountController.bankDetails.value!.routingNo,
                            ),
                          ],
                        )
                      : Form(
                          key: accountController.editBankAccFormKey,
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
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
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
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // controller.signup();
                                        accountController.editBankDetails.toggle();
                                      },
                                      style: buttonStyleOutlinedWhite,
                                      child: const Text('Cancel'),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // controller.signup();
                                        accountController.editAccountDetails();
                                      },
                                      style: buttonStylePrimary,
                                      child: const Text('Save Changes'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ))),
        ),
      ),
    );
  }
}
