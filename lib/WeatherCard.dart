
import 'package:clothes/pages/MainPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'CustomColors.dart';
import 'Func_icons.dart';
import 'bloc/WeatherBloc.dart';
import 'events/WeatherEvent.dart';

class WeatherCard extends StatelessWidget {
  final String title;
  final int temperature;
  final String iconCode;
  final String description;
  final double temperatureFontSize;
  final double iconScale;
  final Size size;
  final GlobalKey<MainPageState> myWidgetStateKey = new GlobalKey<MainPageState>();

   WeatherCard(this.title, this.temperature, this.iconCode, this.description, this.size, {this.temperatureFontSize = 32, this.iconScale = 10, super.key});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
      child: Container(
        height: size.height * 0.35,
        width: size.width * 0.75,
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
          child: Padding(padding: EdgeInsets.fromLTRB(5, 25, 5, 25),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      // child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text(this.title, style: TextStyle(
                      //       fontFamily: 'Montserrat',
                      //       fontSize: 20,
                      //       color: CustomColors.light_coffee_clr,),),
                      //     IconButton(onPressed: null, icon: Icon(Icons.location_pin))
                      //   ],
                      // )
                    child: RichText(
                      text: TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = () {
                          myWidgetStateKey.currentState?.onTap();
                        },
                        children: [
                          TextSpan(text: this.title, style: TextStyle(fontFamily: 'Nexa',fontSize: 22, color: CustomColors.dark_brown_tint,),),
                          WidgetSpan(child: Icon(Icons.location_pin, color: CustomColors.dark_brown_tint,)),
                        ]
                      ),
                    ),
                  ),
                  Image.network("http://openweathermap.org/img/wn/${this.iconCode}@2x.png", scale: this.iconScale,),
                  Container(
                    child: Text('${this.temperature}°', style: TextStyle(
                        color: CustomColors.dark_brown_tint,
                        fontFamily: 'Montserrat',
                        fontSize: 38),),
                  ),
                  // Container(
                  //   height: size.height * 0.35 * 0.7,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          )
      ),
    );


  }
}

class MySearchDelegate extends SearchDelegate {
  String selectedResult = '';
  final Function callback;
  @override
  String get searchFieldLabel => 'Поиск';

  MySearchDelegate(this.callback);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  @override
  void showResults(BuildContext context) {
    selectedResult = query;
    callback(query);
    close(context, query);
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> searchResults = ["Ростов-на-Дону","Москва","Санкт-Петербург","Воронеж","Самара","Екатеринбург","Краснодар", query].where((element) => element.contains(query)).toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index]),
          onTap: () {
            selectedResult = searchResults[index];
            callback(selectedResult);
            Navigator.pop(context);
          },
        );
      },
    );
  }
}