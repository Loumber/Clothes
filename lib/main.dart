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

// Map<int, Color> color =
// {
//   50:Color.fromRGBO(4,131,184, .1),
//   100:Color.fromRGBO(4,131,184, .2),
//   200:Color.fromRGBO(4,131,184, .3),
//   300:Color.fromRGBO(4,131,184, .4),
//   400:Color.fromRGBO(4,131,184, .5),
//   500:Color.fromRGBO(4,131,184, .6),
//   600:Color.fromRGBO(4,131,184, .7),
//   700:Color.fromRGBO(4,131,184, .8),
//   800:Color.fromRGBO(4,131,184, .9),
//   900:Color.fromRGBO(4,131,184, 1),
// };

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
        //home: MyNavigationBar()//DefaultTabController(
       //   length: 3,
       //   child: Scaffold(
       //     appBar: AppBar(
       //      shadowColor: null,
       //      backgroundColor: light_coffee_clr,
       //      title: const Text('Clothes', style: TextStyle(fontFamily: 'Montserrat',fontSize: 26, color: dark_coffee_clr),),
       //      ),
       //      backgroundColor: dark_brown_clr,
       //      bottomNavigationBar: menu(),
       //      body: TabBarView(
       //        children: [
       //         Container(),
       //         MainPage(),
       //         Container(child: Icon(Icons.directions_bike)),
       //       ],
       //     ),
       //  // body: Center(
       //  //   child: MainPage(),
       //  // ),
       //   ),
       //
       // ),
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




