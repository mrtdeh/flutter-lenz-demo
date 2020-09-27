import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'componnents/bottomBar.dart';
import 'package:testr/routes.dart';
import 'package:testr/componnents/customcheckInternet.dart';

class Starter extends StatefulWidget {
  Starter({Key key}) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey();
  @override
  _StarterState createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  var currentBackPressTime;
  Future<bool> didPopRoute() async {
    final NavigatorState navigator = widget.navigatorKey.currentState;
    assert(navigator != null);
    var maybepop = navigator.canPop();
    print(maybepop);

    DateTime now = DateTime.now();
    if (!maybepop &&
        (currentBackPressTime == null ||
            now.difference(currentBackPressTime) > Duration(seconds: 2))) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
          msg: "This is Center Short Toast",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.black87,
          fontSize: 16.0);

      return Future.value(false);
    }

    return !await navigator.maybePop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return await didPopRoute();
        },
        child: Navigator(
          key: widget.navigatorKey,
          initialRoute: '/',
          onGenerateRoute: generateRoutes,
        ),
      ),
      bottomNavigationBar: FABBottomAppBar(
        color: Colors.grey,
        height: 40,
        backgroundColor: Color(0xFF101010),
        selectedColor: Theme.of(context).accentColor,
        onTabSelected: (value) {
          switch (value) {
            case 0:
              widget.navigatorKey.currentState.pushNamed("/");
              break;
            case 1:
              widget.navigatorKey.currentState.pushNamed("/search");
              break;
            case 2:
              widget.navigatorKey.currentState.pushNamed("/account");
              break;
            case 3:
              widget.navigatorKey.currentState.pushNamed("/sounds");
              break;
            case 4:
              widget.navigatorKey.currentState.pushNamed("/account");
              break;
          }
        },
        items: [
          FABBottomAppBarItem(iconData: Icons.home),
          FABBottomAppBarItem(iconData: Icons.search),
          FABBottomAppBarItem(iconData: Icons.account_circle),
          FABBottomAppBarItem(iconData: Icons.more_horiz),
          FABBottomAppBarItem(iconData: Icons.accessible),
        ],
      ),
    );
  }
}
