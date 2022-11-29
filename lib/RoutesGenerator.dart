import 'package:clothes/pages/CLothesListPage.dart';
import 'package:clothes/MyNavigationBar.dart';
import 'package:clothes/pages/SelectOutfitPage.dart';
import 'package:clothes/pages/TestPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/ItemPage.dart';
import 'pages/MainPage.dart';

class RoutesGenerator {
  static const String homePage = '/';
  static const String selectOutfitPage = '/selectoutfitpage';
  static const String clothesListPage = '/clotheslistpage';
  static const String itemPage = '/itempage';



  // String title;
  //
  // RoutesGenerator(this.title);
  //RoutesGenerator._(String t) {this.title;}

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
      case clothesListPage:
        return MaterialPageRoute(
          builder: (_) => ClothesListPage(),
          settings: RouteSettings(
            arguments: settings.arguments,
          ),
        );
      case itemPage:
        return MaterialPageRoute(
          builder: (_) => ItemPage(),
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
