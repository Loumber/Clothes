import 'package:clothes/Func_icons.dart';
import 'package:clothes/database/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/ClothesInfo.dart';
import '../CustomColors.dart';
import '../RoutesGenerator.dart';
import '../models/RouteArguments.dart';

class ItemPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final ClothesInfo item = ModalRoute.of(context)!.settings.arguments as ClothesInfo;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: CustomColors.dark_brown_tint
        ),
        shadowColor: null,
        elevation: 0,
        backgroundColor: CustomColors.light_coffee_clr,
        title: const Text('Clothes', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: CustomColors.dark_brown_tint),),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: InkWell(
              child: Text('ItemPage',style: TextStyle(fontSize: 30)),
              onTap: () => {
                Navigator.of(context)?.pushNamed(RoutesGenerator.editClothesPage, arguments: item),
              },
          ),
        ),
      )
    );

  }

}