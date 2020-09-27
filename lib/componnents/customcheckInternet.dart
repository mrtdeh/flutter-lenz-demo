import 'package:flutter/material.dart';
import 'package:testr/libraries/checkInternet.dart';

class CustomCheckinternet extends StatelessWidget {
  Widget child;
  CustomCheckinternet({this.child});

  @override
  Widget build(BuildContext context) {
    return CheckInternet(
      doneWidget: child,
      loadingWidget: Center(
        child: CircularProgressIndicator(),
      ),
      errorbuilder: (refresh) {
        return Card(
          color: Colors.white,
          child: Column(
            children: [
              Text(
                "no internet connection",
                style: TextStyle(color: Colors.red),
              ),
              RaisedButton(
                onPressed: () => refresh(),
                child: Text("again"),
              )
            ],
          ),
        );
      },
    );
  }
}
