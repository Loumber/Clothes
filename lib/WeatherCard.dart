import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CustomColors.dart';
import 'Func_icons.dart';

class WeatherCard extends StatelessWidget {
  final String title;
  final int temperature;
  final String iconCode;
  final double temperatureFontSize;
  final double iconScale;

  const WeatherCard(this.title, this.temperature, this.iconCode, {this.temperatureFontSize = 32, this.iconScale = 10, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        child: Text(this.title, style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            color: CustomColors.light_coffee_clr,),)
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: Text('${this.temperature}°', style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: CustomColors.light_coffee_clr,
                          fontSize: 38),),
                    )
                  ],
                ),
              ),
              Image.network("http://openweathermap.org/img/wn/${this.iconCode}@2x.png", scale: this.iconScale),
            ],
          ),
        )
    );


  }
}