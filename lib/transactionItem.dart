import 'package:flutter/material.dart';

import './transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction _transaction;

  TransactionItem(this._transaction);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.purple, width: 2)),
          padding: EdgeInsets.all(10),
          child: Text(
            _transaction.amount.toString(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.purple),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _transaction.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Text(
              _transaction.date.toString(),
              style: TextStyle(fontSize: 12, color: Colors.grey),
            )
          ],
        )
      ],
    );
  }
}
