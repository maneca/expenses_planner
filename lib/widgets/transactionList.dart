import 'package:flutter/material.dart';

import './transactionItem.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _deleteTransaction;

  TransactionList(this._transactions, this._deleteTransaction);

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
                  return TransactionItem(
                      _transactions[index], _deleteTransaction);
                },
                itemCount: _transactions.length,
              ));
  }
}
