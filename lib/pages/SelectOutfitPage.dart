
import 'package:flutter/material.dart';

import '../CustomColors.dart';

class SelectOutfitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: CustomColors.dark_coffee_clr
        ),
        shadowColor: null,
        backgroundColor: CustomColors.light_coffee_clr,
        title: const Text('Clothes', style: TextStyle(fontFamily: 'Montserrat',fontSize: 26, color: CustomColors.dark_coffee_clr),),
      ),
      backgroundColor: CustomColors.dark_brown_clr,
      body: Center(
        child: Container(
          child: Text('SelectOutfitPage',style: TextStyle(fontSize: 30)),
        ),
      ),
    );

  }
}
