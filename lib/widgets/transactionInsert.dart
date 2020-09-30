import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionInsert extends StatefulWidget {
  final Function transactionInsert;

  TransactionInsert(this.transactionInsert);

  @override
  _TransactionInsertState createState() => _TransactionInsertState();
}

class _TransactionInsertState extends State<TransactionInsert> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void submitData() {
    var title = _titleController.text;
    var amount = double.tryParse(_amountController.text);

    if (title.isEmpty || amount <= 0) {
      return;
    }

    widget.transactionInsert(title, amount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: _titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: _amountController,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              onPressed: submitData,
              child: Text("Add Transaction"),
              textColor: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
