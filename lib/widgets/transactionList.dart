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
        child: _transactions.isEmpty
            ? Column(
                children: [
                  Text(
                    "No transactions added yet",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 200,
                      child: Image.asset(
                        "assets/images/waiting.png",
                        fit: BoxFit.cover,
                      ))
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return TransactionItem(_transactions[index]);
                },
                itemCount: _transactions.length,
              ));
  }
}
