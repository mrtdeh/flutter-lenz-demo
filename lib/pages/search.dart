import 'package:flutter/material.dart';

class SearchForm extends StatefulWidget {
  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text("Serach form"),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/account");
          },
          child: Text("Account"),
          color: Colors.red,
        ),
        RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("back"),
        ),
      ],
    );
  }
}
