import 'package:flutter/material.dart';

import './transactionItem.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;

  TransactionList(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        /* ListView.builder() builds widgets as required (i.e. when they can be seen)
         It's preferable for lists that you do not know its size
       */
        child: ListView.builder(
          itemBuilder: (context, index) {
            return TransactionItem(_transactions[index]);
          },
          itemCount: _transactions.length,
        ));
  }
}
