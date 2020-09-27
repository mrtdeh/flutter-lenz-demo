import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

//import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatefulWidget {
  Carousel({
    this.images,
  });

  final List<String> images;

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _pageIndex = 0;
  Timer _timer;
  PageController _pageController = PageController(initialPage: 1);

  _startTimer() {
    const oneSec = const Duration(seconds: 5);
    this._timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          // print(_pageIndex.toString());
          _pageIndex += 1;
          if (_pageIndex >= widget.images.length) _pageIndex = 0;

          _pageController.animateToPage(
            _pageIndex,
            duration: Duration(milliseconds: 1000),
            curve: Curves.ease,
          );
        },
      ),
    );
  }

  _onPageChanged(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    this._timer.cancel();
    _startTimer();

    return Container(
      child: Positioned.fill(
        child: PageView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          controller: _pageController,
          itemCount: widget.images.length,
          itemBuilder: (BuildContext context, int index) {
            // print("index: " + (index - 1).toString());
            return GestureDetector(
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.images[index],
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          // colorFilter:
                          //     ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                        ),
                      ),
                    ),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    bottom: 0,
                    child: Container(
                      height: 200,
                      alignment: Alignment.bottomRight,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: FractionalOffset.bottomCenter,
                        end: FractionalOffset.center,
                        colors: [
                          Theme.of(context).primaryColor,
                          Colors.transparent
                        ],
                      )),
                    ),
                  )
                ],
              ),
              onTap: () {
                // print(index);
              },
            );
          },
          onPageChanged: _onPageChanged,
        ),
      ),
    );
  }
}
