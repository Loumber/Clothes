
import 'package:flutter/material.dart';

const dark_brown_clr = Color(0xFF6C4038);
const light_coffee_clr = Color(0xFFECD6C7);
const dark_coffee_clr = Color(0xFFA39391);

class SelectOutfitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: dark_coffee_clr
        ),
        shadowColor: null,
        backgroundColor: light_coffee_clr,
        title: const Text('Clothes', style: TextStyle(fontFamily: 'Montserrat',fontSize: 26, color: dark_coffee_clr),),
      ),
      backgroundColor: dark_brown_clr,
      body: Center(
        child: Container(
          child: Text('SelectOutfitPage'),
        ),
      ),
    );

  }
}
