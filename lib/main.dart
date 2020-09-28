import 'package:expenses_planner/transaction.dart';
import 'package:flutter/material.dart';

import './transaction.dart';
import './transactionItem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> _transactions = [
    Transaction(
        id: "t1", title: "New shoes", amount: 69.99, date: DateTime.now()),
    Transaction(
        id: "t2",
        title: "Weekly groceries",
        amount: 16.53,
        date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "Flutter app",
        )),
        body: Column(
          children: [
            Container(
                width: double.infinity,
                child: Card(
                    color: Colors.blue, elevation: 5, child: Text("CHART"))),
            Column(
                children: _transactions.map((tx) {
              return Card(
                child: TransactionItem(tx),
              );
            }).toList())
          ],
        ));
  }
}
