import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final Function showDate;

  AdaptiveFlatButton(this.text, this.showDate);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: showDate,
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ))
        : FlatButton(
            textColor: Theme.of(context).primaryColor,
            onPressed: showDate,
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ));
  }
}
