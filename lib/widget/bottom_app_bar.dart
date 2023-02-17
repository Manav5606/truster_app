import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truster_app/view/settings/settings_screen.dart';

import '../const/color_constants.dart';
import '../view/bank_details/bank_details_screen.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      //bottom navigation bar on scaffold
      color: bottomBarGrey,
      shape: const CircularNotchedRectangle(), //shape of notch
      notchMargin: 0, //notche margin between floating button and bottom appbar
      child: SizedBox(
        height: Get.height * 0.10,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextButton(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home_outlined,
                    color: index == 0 ? primary : bottomBarInactiveIcon,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(color: index == 0 ? primary : bottomBarInactiveIcon),
                  ),
                ],
              ),
              onPressed: () {
                if (index != 0) {
                  Get.back();
                }
              },
            ),
            TextButton(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.history_outlined,
                    color: index == 1 ? primary : bottomBarInactiveIcon,
                  ),
                  Text(
                    'History',
                    style: TextStyle(color: index == 1 ? primary : bottomBarInactiveIcon),
                  ),
                ],
              ),
              onPressed: () {},
            ),
            TextButton(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_balance_outlined,
                    color: index == 2 ? primary : bottomBarInactiveIcon,
                  ),
                  Text(
                    'Bank',
                    style: TextStyle(color: index == 2 ? primary : bottomBarInactiveIcon),
                  ),
                ],
              ),
              onPressed: () {
                if (index == 0) {
                  Get.to(() => BankDetailsScreen());
                } else {
                  Get.off(() => BankDetailsScreen());
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 90),
              child: TextButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.settings_outlined,
                      color: index == 3 ? primary : bottomBarInactiveIcon,
                    ),
                    Text(
                      'Settings',
                      style: TextStyle(color: index == 3 ? primary : bottomBarInactiveIcon),
                    ),
                  ],
                ),
                onPressed: () {
                  if (index == 0) {
                    Get.to(() => const SettingsScreen());
                  } else {
                    Get.off(() => const SettingsScreen());
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
