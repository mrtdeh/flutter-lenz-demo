import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class FilmBox extends StatelessWidget {
  FilmBox({
    Key key,
    this.title,
    this.subtitle,
    this.color = Colors.black,
    this.imageUrl,
    // this.direction,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Color color;
  final String imageUrl;
  // FilmBoxGradiantDirection direction;

  final double _margin = 3;
  final double _radius = 3;
  final double _height = 85;

  Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: _height,
          //  width: MediaQuery.of(context).sizeidth,
          margin: EdgeInsets.all(_margin),
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(_radius),
            image: DecorationImage(
              fit: BoxFit.cover,

              // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),

              alignment: Alignment.topCenter,
              image: AssetImage(
                imageUrl,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(_margin),
          height: _height,
          alignment: Alignment.bottomRight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_radius),
              gradient: LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomCenter,
                colors: [
                  darken(color, .2).withOpacity(.3),
                  darken(color, .2).withOpacity(.9),
                ],
              )),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  height: 1,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
        )
      ],
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
