
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
                    Container()
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
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 20.0, 15.0),
        child: Container(
          height: 150,
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CustomColors.light_coffee_clr,
          ),
          child:  Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(icon, size: 70),
                Text(arguments.title, style: TextStyle(fontFamily: 'Montserrat', fontSize: 18),textAlign: TextAlign.center,),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}