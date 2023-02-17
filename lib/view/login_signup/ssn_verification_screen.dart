import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truster_app/controller/sign_up_controller.dart';

import '../../const/color_constants.dart';
import '../../const/theme_const.dart';

class SSNVerificationScreen extends StatelessWidget {
  SSNVerificationScreen({Key? key}) : super(key: key);
  final SignUpController controller = SignUpController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text(
          'Verification',
          style: appBarTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Obx(
          () => Form(
            key: controller.ssnVerificationFormKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (controller.detailsNotFoundError.value)
                    Container(
                      decoration: BoxDecoration(color: red.withOpacity(0.25), borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'Your details doesn’t match. Kindly recheck the details you entered.',
                          style: errorRedTextStyle,
                        ),
                      ),
                    ),
                  const SizedBox(height: 15),
                  const Text(
                    'Full Name* (same as your SSN)',
                    style: textLabelTextStyle,
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    decoration: const InputDecoration(border: OutlineInputBorder()),
                    controller: controller.nameText,
                    validator: (value) {
                      if (value == '') {
                        return 'Please enter name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'SSN number*',
                    style: textLabelTextStyle,
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'xxx-xx-xxxx', border: OutlineInputBorder()),
                    controller: controller.ssnNumberText,
                    validator: (value) {
                      if (value == '') {
                        return 'Please enter SSN number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'DOB*',
                    style: textLabelTextStyle,
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.selectDOB(context);
                            },
                            icon: const Icon(Icons.calendar_month_outlined))),
                    controller: controller.dobText,
                    validator: (value) {
                      if (value == '') {
                        return 'Please enter DOB';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Upload Driving License*',
                    style: textLabelTextStyle,
                  ),
                  const SizedBox(height: 5),
                  DottedBorder(
                    strokeWidth: 1,
                    color: controller.showDLImageError.value ? red : black,
                    radius: const Radius.circular(4),
                    borderType: BorderType.RRect,
                    dashPattern: const [5],
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: 'Upload in pdf, jpg, jpeg, png format', border: InputBorder.none),
                              controller: controller.dlFileNameText,
                              readOnly: true,
                              validator: (value) {
                                    controller.validateDLImage();
                                return null;
                              },
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              controller.selectDlImage();
                            },
                            icon: const Icon(Icons.contact_mail_outlined))
                      ],
                    ),
                  ),
                  if (controller.showDLImageError.value)
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, top: 8),
                      child: Text(
                        'Please upload driving license',
                        style: textLabelTextStyle.copyWith(color: Colors.red[800], fontSize: 12),
                      ),
                    ),

                  /*TextFormField(
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(borderSide: BorderSide(style: BorderStyle)),
                        suffixIcon: ),
                    // controller: controller.emailText,
                    readOnly: true,
                    validator: (value) {
                      if (value == '') {
                        return 'Please enter DOB';
                      }
                      return null;
                    },
                  ),*/
                  const SizedBox(height: 30),
                  Obx(
                    () => ElevatedButton(
                      onPressed: () {
                        controller.verifySSNNumber();
                      },
                      style: buttonStylePrimary,
                      child: controller.loggingIn.value
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Color(0xFFD2D2D2),
                                      strokeWidth: 2,
                                    )),
                                SizedBox(
                                  width: 15,
                                ),
                                Text('Verifying')
                              ],
                            )
                          : const Text('Verify'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
