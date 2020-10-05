import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RowShowMore extends StatelessWidget {
  RowShowMore({
    this.title,
    this.buttonText,
    this.route,
    this.children,
    // this.fixed = false,
  });

  // final bool fixed;
  final String title;
  final String buttonText;
  final String route;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      padding: children != null ? EdgeInsets.only(bottom: 20) : null,
      child: Column(children: [
        Row(
          // Trick : Fit colums to bottom (in Row widget)
          crossAxisAlignment: CrossAxisAlignment.end,

          // ============================
          children: [
            Expanded(
              child: Container(
                // color: Colors.red,
                padding: EdgeInsets.only(right: 10),
                height: 25,
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 18),
                ),
              ),
            ),
            if (buttonText != null)
              Expanded(
                child: Container(
                  height: 25,
                  // color: Colors.black,
                  alignment: Alignment.centerLeft,
                  child: FlatButton(
                    padding: EdgeInsets.all(0),
                    textColor: Colors.yellowAccent,
                    onPressed: () => {},
                    child: Text(
                      buttonText,
                    ),
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 10),
        Visibility(
          visible: children != null,
          child: SizedBox(
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: children != null ? children : [],
            ),
          ),
        ),
      ]),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
