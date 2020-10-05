import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:transparent_image/transparent_image.dart';

class ItemBox extends StatelessWidget {
  ItemBox({
    this.text,
    this.image,
    this.rate = 0,
  });

  final String text;
  final String image;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5).copyWith(bottom: 20),
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
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      image: AssetImage(
                        "assets/images/img-placeholder.png",
                      ),
                    ),
                  ),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    imageCacheHeight: 120,
                    fit: BoxFit.fill,
                    height: 120,
                    width: 100,
                    image: image,
                  ),
                ),
              ),
              Container(
                // color: Colors.red,
                padding: EdgeInsets.all(5).copyWith(top: 5),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      height: 28,
                      margin: EdgeInsets.only(bottom: 5),
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
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 8,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            child: Row(
                              textDirection: TextDirection.ltr,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  rate.toString(),
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
      ),
    );

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
