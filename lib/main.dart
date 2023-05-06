import 'package:clothes/database/database.dart';
import 'package:clothes/pages/AddClothesPage.dart';
import 'package:clothes/RoutesGenerator.dart';
import 'package:clothes/pages/SelectOutfitPage.dart';
import 'package:clothes/pages/WardrobePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'CustomColors.dart';
import 'MainNavigationBar.dart';

import 'clothesBloc/ClothesBloc.dart';
import 'pages/MainPage.dart';


AppDb? db;

void main() {
  db = AppDb();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ClothesBloc(),
      child: MaterialApp(
        initialRoute: RoutesGenerator.homePage,
        onGenerateRoute: RoutesGenerator.generateRoute,
        title: 'Clothes',
        theme: ThemeData(
            textSelectionTheme: TextSelectionThemeData(
              selectionHandleColor: CustomColors.dark_brown_tint2,
            ),
            fontFamily: 'Nexa',
            backgroundColor: Colors.white,
            ),

        //debugShowCheckedModeBanner: false,
      ),
    );
  }
}





