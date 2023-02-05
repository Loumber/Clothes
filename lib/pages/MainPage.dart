
import 'package:clothes/main.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../CustomColors.dart';
import '../RoutesGenerator.dart';
import '../bloc/WeatherBloc.dart';
import '../components/WeatherCardWrapper.dart';
import '../events/WeatherEvent.dart';
import '../states/WeatherState.dart';
import 'package:geolocator/geolocator.dart';

import '../states/WeatherState.dart';


//
//
class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainPageState();

}


class MainPageState extends State<MainPage>{
  late WeatherState wstate;

  void onTap() {
    showSearch(
        context: context, delegate: MySearchDelegate((query) {
      BlocProvider.of<WeatherBloc>(context).add(WeatherRequested(city: query));
    }));
  }


  @override
  Widget build(BuildContext context) {
    wstate = context.watch<WeatherBloc>().state;
    // TODO: implement build

          if (wstate is WeatherLoadSuccess) {
            return Center(
                child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WeatherCardWrapper(
                            weather: (wstate as WeatherLoadSuccess).weather,
                            size: MediaQuery
                                .of(context)
                                .size),


                        SizedBox(height: 10,),

                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.75, //180
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: CustomColors
                                  .light_coffee_tint),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [BoxShadow(
                                color: CustomColors.light_coffee_tint,
                                spreadRadius: 1,
                                blurRadius: 10,
                                blurStyle: BlurStyle.normal,

                              )
                              ]
                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                showSearch(
                                    context: context, delegate: MySearchDelegate((query) {
                                  BlocProvider.of<WeatherBloc>(context).add(WeatherRequested(city: query));
                                }));

                              },
                              child: Text(
                                'Изменить город',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Nexa',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 21,
                                  letterSpacing: 0.0,
                                  color: CustomColors.dark_brown_tint,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 10,),

                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.75,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: CustomColors
                                  .light_coffee_tint),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [BoxShadow(
                                color: CustomColors.light_coffee_tint,
                                spreadRadius: 1,
                                blurRadius: 10,
                                blurStyle: BlurStyle.normal,

                              )
                              ]
                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context)?.pushNamed(
                                    RoutesGenerator.selectOutfitPage);
                              },
                              child: Text(
                                'Подобрать одежду',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 21,
                                  letterSpacing: 0.0,
                                  color: CustomColors.dark_brown_tint,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 50, width: 100),
                      ],
                    )
                )
            );
          };
            return Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      backgroundColor: CustomColors.light_coffee_clr,
                      color: CustomColors.dark_brown_clr,
                    ),
                    SizedBox(height: 30,),
                    Text('Ожидается интернет-соединение', style: TextStyle(fontSize: 19, color: CustomColors.dark_brown_tint),)
                  ],
                ),
              ),
            );
          }
        //}
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

