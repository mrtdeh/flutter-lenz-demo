import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testr/pages/account.dart';
import 'package:testr/pages/home.dart';
import 'package:testr/pages/search.dart';
import 'package:testr/pages/sounds.dart';

Route generateRoutes(RouteSettings settings) {
  WidgetBuilder builder;

  switch (settings.name) {
    case '/':
      builder = (BuildContext _) => MyHomePage();
      break;
    case '/account':
      builder = (BuildContext _) => Account();
      break;
    case '/search':
      builder = (BuildContext _) => SearchForm();
      break;
    case '/sounds':
      builder = (BuildContext _) => Sounds();
      break;
    default:
      throw Exception('Invalid route: ${settings.name}');
  }
  return MaterialPageRoute(builder: builder, settings: settings);
}
