import 'package:flutter/material.dart';
import 'package:testr/theme.dart';
import 'package:testr/starter.dart';
import 'package:testr/componnents/customcheckInternet.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    MyAppTheme appTheme = MyAppTheme(isDark: true)
      ..accent1 = Colors.amber
      ..bg1 = Color(0xFF1a1a1a);
    // Provide appTheme to the entire sub-tree

    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme.themeData,
      home: Starter(),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: CustomCheckinternet(child: child),
        );
      },
    );
  }
}
