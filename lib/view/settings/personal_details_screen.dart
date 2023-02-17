import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/color_constants.dart';
import '../../const/theme_const.dart';
import '../../controller/sign_up_controller.dart';

class PersonalDetailsScreen extends StatelessWidget {
  PersonalDetailsScreen({Key? key}) : super(key: key);
  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: settingAppBarBg,
        title: const Text('Personal details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: CircleAvatar(
                  radius: Get.width * 0.12,
                  backgroundImage: const AssetImage('assets/images/profile_pic_dummy.jpeg'),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Varun Krishnan',
                  style: primaryHeader2TextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 5),
              const Center(
                child: Text(
                  'varunkrishnan0001@gmail.com',
                  style: textLabelTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Full Name',
                style: textLabelTextStyle,
              ),
              const SizedBox(height: 5),
              TextFormField(
                enabled: false,
                decoration: const InputDecoration(border: OutlineInputBorder(), filled: true, isDense: true, fillColor: white),
                initialValue: 'Varun Krishnan',
              ),
              const SizedBox(height: 20),
              const Text(
                'Email Address',
                style: textLabelTextStyle,
              ),
              const SizedBox(height: 5),
              TextFormField(
                enabled: false,
                decoration: const InputDecoration(border: OutlineInputBorder(), filled: true, isDense: true, fillColor: white),
                initialValue: 'varunkrishnan0001@gmail.com',
              ),
              const SizedBox(height: 20),
              const Text(
                'Phone number',
                style: textLabelTextStyle,
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(
                    width: Get.width * 0.2,
                    child: controller.selectedCountryCode.value == ''
                        ? const SizedBox(
                            height: 20,
                            width: 30,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Color(0xFFD2D2D2),
                                strokeWidth: 2,
                              ),
                            ),
                          )
                        : TextFormField(
                            enabled: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              filled: true,
                              isDense: true,
                              fillColor: white,
                              suffixIcon: Icon(Icons.arrow_drop_down),
                              suffixIconConstraints: BoxConstraints(minWidth: 35)
                            ),
                            initialValue: 'US',
                          ),

                    /*DropdownButtonFormField<String>(
                            value: controller.selectedCountryCode.value,
                            items: controller.countryLists
                                .map(
                                  (element) => DropdownMenuItem<String>(
                                    value: element,
                                    child: Text(element),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {},
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              errorStyle: TextStyle(height: 0),
                            ),
                            validator: (value) {
                              if (controller.phoneNumberText.text == '') {
                                return '';
                              }
                              return null;
                            },
                          ),*/
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText:
                              '${controller.selectedCountryCode.value == 'US' ? '(+1)' : controller.selectedCountryCode.value == 'UK' ? '(+44)' : '(+91)'} 4155552617',
                          border: const OutlineInputBorder(),
                          errorStyle: const TextStyle(height: 0),
                          isDense: true),
                      enabled: false,
                      initialValue: '(+1) 415 5552671',
                      /*controller: controller.phoneNumberText,
                      validator: (value) {
                        if (value == '') {
                          controller.validateMobile();
                          return '';
                        }
                        return null;
                      },*/
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Fullname (same as your SSN)',
                style: textLabelTextStyle,
              ),
              const SizedBox(height: 5),
              TextFormField(
                enabled: false,
                decoration: const InputDecoration(border: OutlineInputBorder(), filled: true, isDense: true, fillColor: white),
                initialValue: 'Varun Krishnan  V',
              ),
              const SizedBox(height: 20),
              const Text(
                'SSN number',
                style: textLabelTextStyle,
              ),
              const SizedBox(height: 5),
              TextFormField(
                enabled: false,
                decoration: const InputDecoration(border: OutlineInputBorder(), filled: true, isDense: true, fillColor: white),
                initialValue: '8123 7112 3321',
              ),
              const SizedBox(height: 20),
              const Text(
                'DOB',
                style: textLabelTextStyle,
              ),
              const SizedBox(height: 5),
              TextFormField(
                enabled: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  isDense: true,
                  fillColor: white,
                  suffixIcon: Icon(Icons.calendar_month_outlined),
                ),
                initialValue: '06-01-2002',
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
