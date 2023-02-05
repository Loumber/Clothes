
import 'package:clothes/pages/AddClothesPage.dart';
import 'package:clothes/Func_icons.dart';
import 'package:clothes/pages/WardrobePage.dart';
import 'package:clothes/states/WeatherState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clothes/CustomColors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/WeatherBloc.dart';
import 'events/WeatherEvent.dart';
import 'pages/MainPage.dart';




class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    WardrobePage(),
    MainPage(),
    AddClothesPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // shadowColor: null,
        elevation: 0.0,
        backgroundColor: CustomColors.light_coffee_clr,
        title: const Text('Clothes', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: CustomColors.dark_brown_tint),),
      ),
      backgroundColor: Colors.white,

      body : BlocProvider(
         create: (context) => WeatherBloc(),//WeatherBloc('Ростов-на-Дону'),
         child: BlocBuilder<WeatherBloc, WeatherState>(
         builder: (context, state) {
           return _widgetOptions.elementAt(_selectedIndex);
         },),
      ),
      bottomNavigationBar: SizedBox(
        height: 55,
        child: BottomNavigationBar(
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          backgroundColor: CustomColors.light_coffee_clr,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 35,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Func.clothes_hang, size: 40),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Func.house_main),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Func.add_circle),
              label: '',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: CustomColors.dark_brown_tint,
          unselectedItemColor: CustomColors.dark_coffee_clr,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

