import 'package:clothes/MyNavigationBar.dart';
import 'package:clothes/SelectOutfitPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MainPage.dart';

class RoutesGenerator {
  static const String homePage = '/';
  static const String selectOutfitPage = '/selectoutfitpage';

  RoutesGenerator._() {}

  static Route<dynamic> generateRoute(RouteSettings settings) {
//4.
    switch (settings.name) {
      case homePage:
// .5
        return MaterialPageRoute(
          builder: (_) =>  MyNavigationBar(),
        );
      case selectOutfitPage:
        return MaterialPageRoute(
          builder: (_) => SelectOutfitPage(),
        );
      default:
        throw FormatException("Route not found");
    }

  }
}
// 5.
class RouteException implements Exception {
  final String message;
  const RouteException( this.message);
}
