import 'package:flutter/material.dart';

class LabelBox extends StatelessWidget {
  LabelBox({
    Key key,
    this.text,
    this.color = Colors.transparent,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double psacal = 1.5;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      padding:
          EdgeInsets.symmetric(horizontal: 8 * psacal, vertical: 8 * psacal),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).accentColor),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).accentColor,
          fontSize: 13,
        ),
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
