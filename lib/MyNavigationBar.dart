// import 'dart:html';

import 'package:clothes/AddClothesPage.dart';
import 'package:clothes/WardrobePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MainPage.dart';

const dark_brown_clr = Color(0xFF6C4038);
const light_coffee_clr = Color(0xFFECD6C7);
const dark_coffee_clr = Color(0xFFA39391);


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
    // switch(index) {
    //   case 0:
    //     Navigator.pushNamed(context, '/mainpage');
    //     break;
    //   case 1:
    //     Navigator.pushNamed(context, '/addingpage');
    //     break;
    //   case 2:
    //     Navigator.pushNamed(context, '/wardrobepage');
    //     break;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: null,
        backgroundColor: light_coffee_clr,
        title: const Text('Clothes', style: TextStyle(fontFamily: 'Montserrat',fontSize: 26, color: dark_coffee_clr),),
      ),
      backgroundColor: dark_brown_clr,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: light_coffee_clr,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 40,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_rounded),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: dark_brown_clr,
        onTap: _onItemTapped,
      ),
    );
  }
}