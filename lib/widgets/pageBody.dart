import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'expensesChart.dart';
import 'transactionList.dart';

class PageBody extends StatefulWidget {
  final List<Transaction> transactions;
  final PreferredSizeWidget appBar;

  PageBody(this.transactions, this.appBar);

  @override
  _PageBodyState createState() => _PageBodyState(transactions, appBar);
}

class _PageBodyState extends State<PageBody> {
  final List<Transaction> transactions;
  final PreferredSizeWidget appBar;
  bool _showChart = false;

  _PageBodyState(this.transactions, this.appBar);

  List<Transaction> get _recentTransactions {
    return transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _deleteTransaction(Transaction transaction) {
    setState(() {
      transactions.remove(transaction);
    });
  }

  List<Widget> _buildLandscapeContent(
      MediaQueryData mediaQuery, Widget txListWidget) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Switch.adaptive(
              // adaptive is to show the switch with the design according to the platform(android or ios)
              activeColor: Theme.of(context).accentColor,
              value: _showChart,
              onChanged: (val) {
                setState(() {
                  _showChart = val;
                });
              }),
          Text(
            "Show chart",
            style: Theme.of(context).textTheme.headline6,
          )
        ],
      ),
      _showChart
          ? Container(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.7,
              child: ExpensesChart(_recentTransactions))
          : txListWidget
    ];
  }

  List<Widget> _buildPortraitContent(
      MediaQueryData mediaQuery, Widget txListWidget) {
    return [
      Container(
          height: (mediaQuery.size.height -
                  appBar.preferredSize.height -
                  mediaQuery.padding.top) *
              0.3,
          child: ExpensesChart(_recentTransactions)),
      txListWidget
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final txListWidget = Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.7,
        child: TransactionList(transactions, _deleteTransaction));

    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ... is called spread operator and it flattens a list
          if (isLandscape)
            ..._buildLandscapeContent(mediaQuery, txListWidget)
          else
            ..._buildPortraitContent(mediaQuery, txListWidget)
        ],
      ),
    ));
  }
}
