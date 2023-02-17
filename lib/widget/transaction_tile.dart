import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:truster_app/const/color_constants.dart';
import 'package:truster_app/modal/transaction.dart';

class TransactionTile extends StatelessWidget {
  TransactionTile({Key? key, required this.transaction}) : super(key: key);
  final Transaction transaction;
  final DateFormat dateFormat = DateFormat('dd-MM-yyyy • ').add_jm();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/images/profile_pic_dummy.jpeg'),
      ),
      title: Text(transaction.customerName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dateFormat.format(transaction.dateTime),
            style: const TextStyle(fontSize: 12),
          ),
          Text(
            transaction.productName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Column(
          children: [
            Text(
              '\$ ${transaction.productPrice}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(transaction.status, style: TextStyle(
                fontSize: 12, color: transaction.status == 'Accepted' || transaction.status == 'Completed' ? green :transaction.status == 'Pending'?yellow:orange),)
          ],
        ),
      ),
    );
  }
}
