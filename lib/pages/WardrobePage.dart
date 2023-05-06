
import 'package:clothes/main.dart';
import 'package:clothes/models/RouteArguments.dart';
import 'package:flutter/material.dart';
import 'package:clothes/clothes_icons.dart';

import '../CustomColors.dart';
import '../RoutesGenerator.dart';


class WardrobePage extends StatelessWidget {
  get onPressed => null;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          child: Table(
            children: [
              TableRow(
                children: [
                  Tile(RouteArguments('Аксессуары'), Clothes.scarf),
                  Tile(RouteArguments('Обувь'), Clothes.shoes),
            ],
              decoration: BoxDecoration(
                color: Colors.transparent
              ),
              ),
              TableRow(
                  children: [
                    Tile(RouteArguments('Верх'), Clothes.tshirt),
                    Tile(RouteArguments('Низ'), Clothes.jeans),
                  ]
              ),
              TableRow(
                  children: [
                    Tile(RouteArguments('Верхняя одежда'), Clothes.jacket),
                    Tile(RouteArguments('Все'), Clothes.jacket),
                  ]
              )
            ],
          ),
        ),

      )
    );
  }
}

class Tile extends StatelessWidget {
  RouteArguments arguments;
  IconData icon;

  Tile(this.arguments, this.icon);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () => Navigator.of(context)?.pushNamed(RoutesGenerator.clothesListPage, arguments: arguments),
      child: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.22,
          width: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color : CustomColors.light_coffee_tint),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(
                color: CustomColors.light_coffee_tint,
                spreadRadius: 1,
                blurRadius: 10,
                blurStyle: BlurStyle.normal,

              )]
          ),
          child:  Padding(
            padding: const EdgeInsets.fromLTRB(4, 3, 4, 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(icon, size: 80, color: CustomColors.dark_brown_tint,),
                Text(arguments.title, style: TextStyle(fontSize: 17,color: CustomColors.dark_brown_tint, height: 1.1),textAlign: TextAlign.center,),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}