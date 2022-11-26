
import 'package:flutter/material.dart';
import 'package:clothes/clothes_icons.dart';

import 'RoutesGenerator.dart';

const dark_brown_clr = Color(0xFF6C4038);
const light_coffee_clr = Color(0xFFECD6C7);
const dark_coffee_clr = Color(0xFFA39391);

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
                  Tile('Аксессуары', Clothes.scarf),
                  Tile('Обувь', Clothes.shoes),
            ],
              decoration: BoxDecoration(
                color: Colors.transparent
              ),
              ),
              TableRow(
                  children: [
                    Tile('Верх', Clothes.tshirt),
                    Tile('Низ', Clothes.jeans),
                  ]
              ),
              TableRow(
                  children: [
                    Tile('Верхняя одежда', Clothes.jacket),
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
  String title;
  IconData icon;

  Tile(this.title, this.icon);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () => Navigator.of(context)?.pushNamed(RoutesGenerator.clothesListPage),
      child: Padding(
        padding: EdgeInsets.fromLTRB(15.0, 20.0, 20.0, 20.0),
        child: Container(
          height: 150,
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: light_coffee_clr,
          ),
          child:  Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(icon, size: 70),
                Text(title, style: TextStyle(fontFamily: 'Montserrat', fontSize: 18),textAlign: TextAlign.center,),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}