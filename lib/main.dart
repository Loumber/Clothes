import 'package:clothes/AddClothesPage.dart';
import 'package:clothes/RoutesGenerator.dart';
import 'package:clothes/SelectOutfitPage.dart';
import 'package:clothes/WardrobePage.dart';
import 'package:flutter/material.dart';
import 'MyNavigationBar.dart';

import 'MainPage.dart';

const dark_brown_clr = Color(0xFF6C4038);
const light_coffee_clr = Color(0xFFECD6C7);
const dark_coffee_clr = Color(0xFFA39391);


void main() {
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



Widget menu() {
  return Container(
      color: dark_brown_clr,
      child: TabBar(

         indicatorColor: light_coffee_clr,
         labelColor: dark_coffee_clr,
         unselectedLabelColor: dark_coffee_clr,
        indicator: BoxDecoration(
          border: Border.all(color: light_coffee_clr),
          borderRadius: BorderRadius.circular(10),
          color: light_coffee_clr,
        ),
         indicatorSize: TabBarIndicatorSize.tab,
         indicatorPadding: EdgeInsets.all(5.0),
         tabs: const [
             Tab(
               //text: "Transactions",
                icon: Icon(Icons.view_list_sharp, size:40),
             ),
             Tab(
               //text: "Transactions",
               icon: Icon(Icons.home_rounded, size:40),
              ),
             Tab(
                //text: "Transactions",
                icon: Icon(Icons.add_circle_outline,size: 40),

             ),
         ],
  ),
  );
}




