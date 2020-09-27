import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RowShowMore extends StatelessWidget {
  RowShowMore({
    Key key,
    this.title,
    this.buttonText,
    this.route,
    this.children,
    // this.fixed = false,
  }) : super(key: key);

  // final bool fixed;
  final String title;
  final String buttonText;
  final String route;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 3),
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              // Trick : Fit colums to bottom (in Row widget)
              crossAxisAlignment: CrossAxisAlignment.end,
              // ============================
              children: [
                Expanded(
                  child: Column(
                      verticalDirection: VerticalDirection.down,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            // color: Colors.red,
                            height: 25,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(right: 15),
                            child: Text(
                              title,
                              style: TextStyle(
                                color: Colors.white,
                                // backgroundColor: Colors.blue,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
                Expanded(
                  child: Column(children: [
                    if (buttonText != null)
                      Container(
                        height: 25,
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
                  ]),
                ),
              ],
            ),
            if (children != null)
              SingleChildScrollView(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: children,
                ),
              ),
          ],
        ));
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
