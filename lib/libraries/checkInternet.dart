import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';

typedef ErrorBuilder = Widget Function(Function refresh);

// ignore: must_be_immutable
class CheckInternet extends StatefulWidget {
  CheckInternet({
    this.loadingWidget,
    this.doneWidget,
    this.errorbuilder,
    this.timeout = 3,
    this.preload = false,
  });
  bool preload;
  ErrorBuilder errorbuilder;
  final Widget loadingWidget;
  final Widget doneWidget;
  final int timeout;

  // refresh() => createState()._check();

  @override
  _CheckInternetState createState() => _CheckInternetState();
}

class _CheckInternetState extends State<CheckInternet> {
  int state = 1;
  bool done = false;

  @override
  void initState() {
    super.initState();
    // widget.navkey.didUpdateWidget((Navigator n){
    //   print("navigator is changed");
    //   return n.;
    // }))
    _check();
    print("widgetupdate....");
  }

  void mytest() {
    print("object");
  }

  void _check() {
    print("start");
    setState(() {
      this.state = 1;
      done = false;
    });

    String address = '8.8.8.8';
    Future<double> pingToAddress = ping(address);

    pingToAddress.then(
      (value) {
        if (value == 0.0) {
          setState(() {
            state = 2;
          });
        } else {
          Future.delayed(Duration(seconds: widget.timeout), () {
            setState(() {
              done = true;
            });
          });
        }
      },
    ).catchError((e) => {print(e)});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          child: widget.loadingWidget,
          visible: !done && state == 1 ? true : false,
        ),
        if (!widget.preload)
          Visibility(
            child: widget.doneWidget,
            visible: done ? true : false,
          )
        else
          Opacity(
            child: widget.doneWidget,
            opacity: done ? 1 : 0,
          ),
        if (state == 2)
          Positioned.fill(
            child: widget.errorbuilder(() {
              return _check();
            }),
          )
      ],
    );
  }
}

// ========================================================================================

/// Information about ping response
class PingInfo {
  Duration time;

  /// Creates a new PingInfo with the given response time
  PingInfo._new(this.time);
}

var _regexUnix = RegExp(r"time=(\d+).");
// var _regexWindows = RegExp(r"time=(\d+)ms");

/// Converts the response on Unix systems into PingInfos using regular expressions
StreamTransformer<String, PingInfo> _unixTransformer =
    StreamTransformer.fromHandlers(handleData: (data, sink) {
  if (data.contains("bytes from")) {
    var match = _regexUnix.firstMatch(data);
    sink.add(PingInfo._new(Duration(milliseconds: int.parse(match.group(1)))));
  }
});

/// Converts the response on Windows systems into PingInfos using regular expressions
// StreamTransformer<String, PingInfo> _windowsTransformer =
//     StreamTransformer.fromHandlers(handleData: (data, sink) {
//   if (data.startsWith("Reply from")) {
//     var match = _regexWindows.firstMatch(data);
//     sink.add(PingInfo._new(Duration(milliseconds: int.parse(match.group(1)))));
//   }
// });

/// Pings host [address]. Returns median value as [double] in Milliseconds
Future<double> ping(String address) async {
  var process = await Process.start("ping", ['-c 1', '-i 1', '-W 3', address]);
  var baseStream =
      process.stdout.transform(utf8.decoder).transform(LineSplitter());

  double totalTime = 0;
  // if (Platform.isWindows) {
  //   await baseStream.transform<PingInfo>(_windowsTransformer).forEach((ping) {
  //     totalTime += ping.time.inMilliseconds;
  //   });
  // } else {
  await baseStream.transform<PingInfo>(_unixTransformer).forEach((ping) {
    totalTime += ping.time.inMilliseconds;
  });
  // }
  return totalTime / 1;
}
