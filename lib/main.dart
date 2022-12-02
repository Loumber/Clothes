import 'package:clothes/database/database.dart';
import 'package:clothes/pages/AddClothesPage.dart';
import 'package:clothes/RoutesGenerator.dart';
import 'package:clothes/pages/SelectOutfitPage.dart';
import 'package:clothes/pages/WardrobePage.dart';
import 'package:flutter/material.dart';
import 'MainNavigationBar.dart';

import 'pages/MainPage.dart';

const dark_brown_clr = Color(0xFF6C4038);
const light_coffee_clr = Color(0xFFECD6C7);
const dark_coffee_clr = Color(0xFFA39391);

AppDb? db;

void main() {
  db = AppDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RoutesGenerator.homePage,
      onGenerateRoute: RoutesGenerator.generateRoute,
      title: 'Clothes',
      theme: ThemeData(
          fontFamily: 'Montserrat',
          backgroundColor: dark_brown_clr,
          ),

      debugShowCheckedModeBanner: false,
    );
  }
}





