import 'package:get/get.dart';

import '../modal/transaction.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  final List<Transaction> _allTransactions = [];
  RxList<Transaction> activeTransactions = RxList.empty();
  RxList<Transaction> completedTransactions = RxList.empty();

  @override
  void onInit() {
    super.onInit();
    getTransactions();
  }

  getTransactions() async {
    _allTransactions.add(Transaction('0', '1', 'Naveen', DateTime.now(), 'Apple iPhone 13 Pro Max', '500', 'Accepted'));
    _allTransactions.add(Transaction(
        '0', '1', 'Naveen', DateTime.now().subtract(const Duration(minutes: 50)), 'Apple iPhone 13 Pro Max', '500', 'Pending'));
    _allTransactions.add(Transaction(
        '0', '1', 'Naveen', DateTime.now().subtract(const Duration(hours: 2)), 'Apple iPhone 13 Pro Max', '500', 'Disputed'));
    _allTransactions.add(Transaction(
        '0', '1', 'Naveen', DateTime.now().subtract(const Duration(hours: 8)), 'Apple iPhone 13 Pro Max', '500', 'Completed'));
    _allTransactions.add(Transaction('0', '1', 'Naveen', DateTime.now().subtract(const Duration(days: 1, minutes: 10)),
        'Apple iPhone 13 Pro Max', '500', 'Completed'));
    completedTransactions.addAll(_allTransactions.where((element) => element.status == 'Completed'));
    activeTransactions.addAll(_allTransactions.where((element) => element.status != 'Completed'));
  }
}
