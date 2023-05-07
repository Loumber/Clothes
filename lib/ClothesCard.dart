

import 'dart:io';

import 'package:clothes/models/ClothesInfo.dart';
import 'package:clothes/pages/SelectOutfitPage.dart';
import 'package:flutter/material.dart';

import 'CustomColors.dart';
typedef IntCallback = void Function(int);

class ClothesCard extends StatelessWidget {
  ClothesInfo item;
  // IntCallback callback;
  // ClothesCard(this.item,this.callback);
  ClothesCard(this.item);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: SizedBox(
        height: 350,
        width: 330,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(color: CustomColors.light_coffee_tint),
              boxShadow: [
                BoxShadow(
                  color: CustomColors.light_coffee_tint,
                  spreadRadius: 1,
                  blurRadius: 14,
                  blurStyle: BlurStyle.normal,
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 5.0),
                  child: Container(
                    height: 220,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(color: CustomColors.light_coffee_tint),
                      color: Colors.transparent,
                      image: DecorationImage(image: FileImage(File(item.imageUrl)),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 15.0),
                  child: Text(item.name,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: CustomColors.dark_brown_tint),),
                ),
                /*Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 15.0),
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          child: Container(
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                              color: CustomColors.dark_brown_tint2,
                              border: Border.all(color : CustomColors.dark_brown_tint2, width: 2.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  //callback(1);
                                },

                                child: Text(
                                  'Удалить',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    //fontWeight: FontWeight.w100,
                                    fontSize: 18,
                                    letterSpacing: 0.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          padding:EdgeInsets.symmetric(horizontal: 5.0),
                        ),
                        Padding(
                          child: Container(
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                              color: CustomColors.dark_brown_tint2,
                              border: Border.all(color : CustomColors.dark_brown_tint2, width: 2.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  //callback(2);
                                },

                                child: Text(
                                  'Поменять',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    //fontWeight: FontWeight.w100,
                                    fontSize: 18,
                                    letterSpacing: 0.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          padding:EdgeInsets.symmetric(horizontal: 5.0),
                        )

                      ],
                    ),
                  ),
                )*/
              ],
            )
        ),
      ),
    );
  }

}