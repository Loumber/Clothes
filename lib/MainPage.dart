
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
            //   child: Icon(Icons.sunny,size:100,color: Colors.amberAccent),
            // ),
            SizedBox(height: 10,),
            // Container(
            //   child: Column(
            //     children: [
            //       Container(
            //           child: Text('Ростов-на-Дону', style: TextStyle(fontFamily: 'Montserrat', color:light_coffee_clr ),)
            //       ),
            //       Container(
            //         child: Text('18°C', style: TextStyle(fontFamily: 'Montserrat',color:light_coffee_clr ),),
            //       )
            //     ],
            //   ),
            // ),
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

class UpdateTextPlace extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => UpdateTextPlaceState();
}

class UpdateTextPlaceState extends State {
  String text_holder = 'Ростов-на-Дону';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Text(text_holder, style: TextStyle(fontFamily: 'Montserrat', color:light_coffee_clr ),)
    );
  }

  changeText(String s) {
    setState(() {
      text_holder = s;
    });
  }
  
}
// children: [
// Container(
// child: Text('Ростов-на-Дону', style: TextStyle(fontFamily: 'Montserrat'),)
// ),
// Container(
// child: Text('18°C', style: TextStyle(fontFamily: 'Montserrat'),),
// )
// ],

// child: Column(
// children: [
// Text('Ростов-на-Дону', style: TextStyle(fontFamily: 'Montserrat',fontSize: 20, color: dark_coffee_clr),),
// Text('18°C', style: TextStyle(fontFamily: 'Montserrat',fontSize: 20, color: dark_coffee_clr),),
// ],
// ),
// child: Container(
// child: ElevatedButton(
// onPressed: () {  },
// child: Text('Подобрать одежду',style: TextStyle(fontFamily: 'Montserrat',fontSize: 20, color: dark_coffee_clr),),),
// ),),),