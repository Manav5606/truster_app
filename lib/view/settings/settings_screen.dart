import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truster_app/const/theme_const.dart';
import 'package:truster_app/view/login_signup/on_boarding_screen.dart';
import 'package:truster_app/view/settings/personal_details_screen.dart';
import 'package:truster_app/widget/bottom_app_bar.dart';

import '../../const/color_constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: settingAppBarBg,
        title: const Text('My Profile'),
        actions: [
          TextButton(
            onPressed: () {
              Get.offAll(() => OnBoardingScreen());
            },
            style: ButtonStyle(foregroundColor: MaterialStateProperty.all(red)),
            child: const Text('Logout'),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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
            const SizedBox(height: 15),
            const Text(
              'Personal information',
              style: header3TextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(border: Border.all(color: grey), borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Get.to(() => PersonalDetailsScreen());
                    },
                    dense: true,
                    title: const Text('Personal Details'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right_outlined),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: grey,
                  ),
                  ListTile(
                    dense: true,
                    title: const Text('Driver license'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right_outlined),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'App security',
              style: header3TextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(border: Border.all(color: grey), borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    title: const Text('App Security Pin'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right_outlined),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: grey,
                  ),
                  ListTile(
                    dense: true,
                    title: const Text('Face lock'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right_outlined),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Bank information',
              style: header3TextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(border: Border.all(color: grey), borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    title: const Text('Banks and cards'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right_outlined),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: grey,
                  ),
                  ListTile(
                    dense: true,
                    title: const Text('Online payment'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right_outlined),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: grey,
                  ),
                  ListTile(
                    dense: true,
                    title: const Text('Fees and regulation'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right_outlined),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: grey,
                  ),
                  ListTile(
                    dense: true,
                    title: const Text('Payment preferences'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right_outlined),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Legal document',
              style: header3TextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(border: Border.all(color: grey), borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    title: const Text('Policy'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right_outlined),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: grey,
                  ),
                  ListTile(
                    dense: true,
                    title: const Text('Help'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right_outlined),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: grey,
                  ),
                  ListTile(
                    dense: true,
                    title: const Text('Legal document'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right_outlined),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: grey,
                  ),
                  ListTile(
                    dense: true,
                    title: const Text('Privacy'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right_outlined),
                    ),
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: grey,
                  ),
                  ListTile(
                    dense: true,
                    title: const Text('Legal agreement'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.chevron_right_outlined),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 45),
          ],
        ),
      )),
      bottomNavigationBar: const CustomBottomAppBar(index: 3),
    );
  }
}
