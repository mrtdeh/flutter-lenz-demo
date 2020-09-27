import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:testr/componnents/filmbox.dart';
import 'package:testr/componnents/labelbox.dart';
import 'package:testr/componnents/itembox.dart';
import 'package:testr/componnents/rowshowmore.dart';
import 'package:testr/componnents/carousel.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _fake_image_url() {
    return "https://picsum.photos/200/300?random=${Random().nextInt(100)}";
  }

  // Get slider images from server and seved to disk and load it.
  List<String> _images = [
    "https://picsum.photos/200/300?image=30",
    "https://picsum.photos/200/300?image=66",
    "https://picsum.photos/200/300?image=35",
    "https://picsum.photos/200/300?image=2",
  ];

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.width);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.only(bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/search");
              },
              child: Text("Search"),
            ),
            Stack(
              children: <Widget>[
                Carousel(
                  images: _images,
                ),
                Container(
                  padding: EdgeInsets.only(top: (300)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 0; i < 10; i++)
                          LabelBox(
                            text: "گزینه اختیاری " + i.toString(),
                            color: Theme.of(context).primaryColor,
                          )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            RowShowMore(
              buttonText: "بیشتر...",
              title: "فیلم های برگزیده",
            ),
            FilmBox(
              title: "film Tilte",
              subtitle: "asdasdasda sd sadas",
              color: Colors.amber,
              imageUrl: 'assets/images/cover.jpg',
            ),
            Row(
              children: [
                Expanded(
                  child: FilmBox(
                    title: "film Tilte",
                    subtitle: "asdasdasda sd sadas",
                    color: Colors.deepOrange,
                    imageUrl: 'assets/images/cover.jpg',
                  ),
                ),
                Expanded(
                  child: FilmBox(
                    title: "film Tilte",
                    subtitle: "asdasdasda sd sadas",
                    color: Colors.pink,
                    imageUrl: 'assets/images/cover.jpg',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            for (int i = 0; i < 10; i++)
              RowShowMore(
                buttonText: "بیشتر...",
                title: "محصولات",
                children: <Widget>[
                  ItemBox(
                      text: "dsfsdf fgdg f gfdgdd fdfgf gf",
                      image: _fake_image_url()),
                  for (int i = 0; i < 10; i++)
                    ItemBox(text: "dsfsdf", image: _fake_image_url())
                ],
              ),
            RowShowMore(
              buttonText: "بیشتر...",
              title: "محصولات",
              children: <Widget>[
                ItemBox(
                    text: "dsfsdf fgdg f gfdgdd fdfgf gf",
                    image: _fake_image_url()),
                for (int i = 0; i < 10; i++)
                  ItemBox(
                      text: "sdfsdf sdfs dfsd fsdfds", image: _fake_image_url())
              ],
            ),
            RowShowMore(
              buttonText: "بیشتر...",
              title: "محصولات",
              children: <Widget>[
                ItemBox(
                    text: "dsfsdf fgdg f gfdgdd fdfgf gf",
                    image: _fake_image_url()),
                for (int i = 0; i < 10; i++)
                  ItemBox(text: "dsfsdf", image: _fake_image_url())
              ],
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
