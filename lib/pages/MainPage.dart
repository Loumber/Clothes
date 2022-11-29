import 'package:clothes/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../CustomColors.dart';
import '../Func_icons.dart';
import '../RoutesGenerator.dart';
import '../bloc/WeatherBloc.dart';
import '../components/WeatherCardWrapper.dart';
import '../events/WeatherEvent.dart';
import '../states/WeatherState.dart';


//
//
class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();

}


class _MainPageState extends State<MainPage>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (context) => WeatherBloc('Ростов-на-Дону'),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadSuccess) {
            return Center(
                child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WeatherCardWrapper(
                            weather: state.weather),

                        SizedBox(height: 10,),

                        SizedBox(
                          width: 180,
                          height: 70,
                          child:ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(CustomColors.light_coffee_clr),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40.0),
                                        //side: BorderSide(color: Colors.red)
                                      )
                                  )
                              ),
                              onPressed: () {
                                showSearch(
                                    context: context, delegate: MySearchDelegate((query) {
                                  BlocProvider.of<WeatherBloc>(context).add(WeatherRequested(city: query));
                                }));},
                              // style: TextButton.styleFrom(backgroundColor: light_coffee_clr),
                              child: Padding(padding: EdgeInsets.all(10),
                                  child:Text('Обновить \n погоду', style: TextStyle(fontFamily: 'Montserrat', color: CustomColors.dark_coffee_clr,fontSize: 22)))),
                        ),

                        SizedBox(height: 10,),


                        SizedBox(
                          child:  ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(CustomColors.light_coffee_clr),
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
                                  child:Text('Подобрать \n одежду', style: TextStyle(fontFamily: 'Montserrat', color: CustomColors.dark_coffee_clr,fontSize: 22)))),
                        ),


                        SizedBox(height: 50,width: 100),
                      ],
                    )
                )
            );

          }
          return Scaffold(
            backgroundColor: dark_coffee_clr,
            body: Center(
              child: CircularProgressIndicator(
                backgroundColor: light_coffee_clr,
                color: dark_brown_clr,
              ),
            ),
          );
        },
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

