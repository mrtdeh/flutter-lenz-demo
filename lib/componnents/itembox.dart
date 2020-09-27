import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ItemBox extends StatelessWidget {
  ItemBox({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 100,
        margin: EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
          color: Color(0xFF2b2b2b),
          boxShadow: [
            BoxShadow(
              color: Colors.black87,
              blurRadius: 15.0,
              offset: Offset(
                0.0, // Move to right 10  horizontally
                6.0, // Move to bottom 10 Vertically
              ),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              child: Container(
                height: 120,
                child: CachedNetworkImage(
                  imageUrl: image,
                  imageBuilder: (context, imageProvider) => Container(
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                        // colorFilter:
                        //     ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Center(
                    child: Text("درحال بارگذاری..."),
                  ), //CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5).copyWith(top: 5),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    height: 28,
                    child: Text(
                      text,
                      overflow: TextOverflow.fade,
                      maxLines: 2,
                      softWrap: true,
                      style: TextStyle(
                        height: 1,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "داستان زندگی رستم",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 8,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        FittedBox(
                          child: Row(
                            textDirection: TextDirection.ltr,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                " 9.7",
                                style: TextStyle(
                                  color: Colors.yellowAccent,
                                  fontSize: 10,
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellowAccent,
                                size: 14,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
