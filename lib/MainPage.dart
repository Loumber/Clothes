
import 'package:clothes/RoutesGenerator.dart';
import 'package:flutter/material.dart';

const dark_brown_clr = Color(0xFF6C4038);
const light_coffee_clr = Color(0xFFECD6C7);
const dark_coffee_clr = Color(0xFFA39391);

class MainPage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Padding(padding: EdgeInsets.all(15),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            child: Text('Ростов-на-Дону', style: TextStyle(fontFamily: 'Montserrat', color:light_coffee_clr ),)
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: Text('18°C', style: TextStyle(fontFamily: 'Montserrat',color:light_coffee_clr, fontSize: 34),),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    child: Icon(Icons.sunny,size:110,color: Colors.amberAccent),
                  ),
                ],
              ),)),
            // Container(

            SizedBox(height: 10,),

            SizedBox(height: 30,width: 100),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(light_coffee_clr),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                            //side: BorderSide(color: Colors.red)
                        )
                    )
                ),
                onPressed: () => Navigator.of(context)?.pushNamed(RoutesGenerator.selectOutfitPage),
               // style: TextButton.styleFrom(backgroundColor: light_coffee_clr),
                child: Padding(padding: EdgeInsets.all(10),
                child:Text('Подобрать \n одежду', style: TextStyle(fontFamily: 'Montserrat', color: dark_coffee_clr,fontSize: 24)))),
            SizedBox(height: 50,width: 100),
          ],
        )
      )
    );
  }
}

