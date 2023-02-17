import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truster_app/controller/account_controller.dart';
import 'package:truster_app/controller/home_controller.dart';
import 'package:truster_app/widget/bottom_app_bar.dart';
import 'package:truster_app/widget/transaction_tile.dart';

import '../../const/color_constants.dart';
import '../../const/theme_const.dart';
import '../bank_details/bank_details_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController controller = Get.put(HomeController(), permanent: true);
  final AccountController accountController = Get.put(AccountController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Hello! Varun',
          style: appBarTextStyle,
        ),
        leading: const Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile_pic_dummy.jpeg'),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.qr_code_scanner_outlined),
              padding: const EdgeInsets.all(0),
              visualDensity: const VisualDensity(horizontal: -3.0, vertical: -4.0)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_outlined),
              padding: const EdgeInsets.all(0),
              visualDensity: const VisualDensity(horizontal: -3.0, vertical: -4.0)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.message_outlined),
              padding: const EdgeInsets.all(0),
              visualDensity: const VisualDensity(horizontal: -3.0, vertical: -4.0)),
          const SizedBox(width: 10)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: const CustomBottomAppBar(index: 0),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(50)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(50)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(50)),
                        fillColor: searchBackground,
                        hintText: 'Search Transactions',
                        isDense: true,
                        prefixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search_outlined,
                              color: grey,
                            )),
                        filled: true),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Active Transactions',
                        style: header2TextStyle,
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'View all',
                          style: textButtonTextStyle,
                        ))
                  ],
                ),
                if (controller.activeTransactions.isNotEmpty)
                  ListView.builder(
                    itemBuilder: (ctx, index) => TransactionTile(transaction: controller.activeTransactions[index]),
                    itemCount: controller.activeTransactions.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Completed Transactions',
                        style: header2TextStyle,
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'View all',
                          style: textButtonTextStyle,
                        ))
                  ],
                ),
                if (controller.completedTransactions.isNotEmpty)
                  ListView.builder(
                    itemBuilder: (ctx, index) => TransactionTile(transaction: controller.completedTransactions[index]),
                    itemCount: controller.completedTransactions.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
