import 'package:clothes/clothesBloc/ClothesBloc.dart';
import 'package:clothes/database/database.dart';
import 'package:clothes/models/RouteArguments.dart';
import 'package:clothes/pages/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import '../ClothesCard.dart';
import '../CustomColors.dart';
import '../models/ClothesInfo.dart';
import 'package:clothes/RoutesGenerator.dart';
import 'package:clothes/Slider.dart';
import 'package:clothes/evaluation_icons.dart';

typedef IntCallback = void Function(int);

class SelectOutfitPageWrapper extends StatelessWidget {
  const SelectOutfitPageWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t = ModalRoute.of(context)!.settings.arguments as int;
    BlocProvider.of<ClothesBloc>(context).add(ClothesSelectionEvent(t));
    return SelectOutfitPage();
  }
}

class SelectOutfitPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SelectOutfitPageState();
}

class SelectOutfitPageState extends State<SelectOutfitPage> {
  Future<bool> _onWillPop() async {
    if (walkButtonText == 'Начать прогулку') {
      return true;
    }

    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Text(
              'Хотите отменить прогулку?',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 21,
                letterSpacing: 0.0,
                color: CustomColors.dark_brown_tint,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                //<-- SEE HERE
                child: const Text(
                  'Нет',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 21,
                    letterSpacing: 0.0,
                    color: CustomColors.dark_brown_tint,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                // <-- SEE HERE
                child: Text(
                  'Да',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 21,
                    letterSpacing: 0.0,
                    color: CustomColors.dark_brown_tint,
                  ),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }

  //WalkButton
  String walkButtonText = 'Начать прогулку';
  int walkButtonTapCounter = 0;
  var walkButtonTextColor = CustomColors.dark_brown_tint;
  var walkButtonBackColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: BackButton(color: CustomColors.dark_coffee_clr),
          shadowColor: null,
          backgroundColor: CustomColors.light_coffee_clr,
          title: const Text(
            'Clothes',
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: CustomColors.dark_brown_tint),
          ),
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<ClothesBloc, ClothesState>(
          builder: (context, state) {
            var clBloc = BlocProvider.of<ClothesBloc>(context);
            //var clBloc = context.watch<ClothesBloc>();

            if (state is ClothesLoadedState) {
              var cardsCount = clBloc.filteredData.length;
              return Padding(
                padding: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).size.height / 7, 0, 0),
                child: Column(
                  children: [
                    Container(
                      height: 350,
                      // width: 400,
                      child: Theme(
                        data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.fromSwatch().copyWith(
                                secondary: CustomColors.dark_coffee_clr)),
                        child: ScrollSnapList(
                          itemBuilder: (BuildContext context, int index) {
                            return ClothesCard(
                              clBloc.filteredData.elementAt(index % cardsCount),
                            );
                          },
                          itemSize: 330,
                          dynamicItemSize: true,
                          itemCount: cardsCount,
                          onItemFocus: (int index) => {
                            //   setState(() {
                            //     _focusedItem = index;
                            // })
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: 70,
                      decoration: BoxDecoration(
                          color: walkButtonBackColor,
                          border:
                              Border.all(color: CustomColors.light_coffee_tint),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.light_coffee_tint,
                              spreadRadius: 1,
                              blurRadius: 10,
                              blurStyle: BlurStyle.normal,
                            )
                          ]),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            if (walkButtonTapCounter == 0) {
                              setState(() {
                                walkButtonTapCounter++;

                                walkButtonText = 'Закончить прогулку';
                                walkButtonTextColor = Colors.white;
                                walkButtonBackColor =
                                    CustomColors.dark_brown_tint2;
                              });
                            } else {
                              showDialog<void>(
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context) {
                                  return EvaluationWindow();
                                },
                              );
                            }
                          },
                          child: Text(
                            walkButtonText,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 21,
                              letterSpacing: 0.0,
                              color: walkButtonTextColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class EvaluationWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.white,
        insetPadding: EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 300,
                  maxHeight: 300,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: CustomColors.light_coffee_tint),
                      boxShadow: [
                        BoxShadow(
                          color: CustomColors.light_coffee_tint,
                          spreadRadius: 1,
                          blurRadius: 5,
                          blurStyle: BlurStyle.normal,
                        )
                      ]),
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Выберете оценку:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: CustomColors.dark_brown_tint2,
                              fontWeight: FontWeight.w700,
                              fontSize: 32,
                            )),
                        SizedBox(height: 45),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              EvaluationIcons.snowflake,
                              color: CustomColors.dark_brown_tint,
                            ),
                            EvalationSlider(),
                            Icon(
                              EvaluationIcons.flame,
                              color: CustomColors.dark_brown_tint,
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 15,
                          ),
                          width: 125,
                          height: 45,
                          decoration: BoxDecoration(
                            color: CustomColors.dark_brown_tint2,
                            border: Border.all(
                                color: CustomColors.dark_brown_tint2,
                                width: 2.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                SendEvaluationToDb();
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    RoutesGenerator.homePage,
                                    (Route<dynamic> route) => false);
                              },
                              child: Text(
                                "Оценить",
                                style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 0.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }
}

void SendEvaluationToDb() {
  int eval = 0;
  switch (EvalationSliderState().step) {
    case 0:
      eval = -6;
      return;
    case 25:
      eval = -3;
      return;
    case 75:
      eval = 3;
      return;
    case 100:
      eval = 6;
      return;
  }
  AppDb().estimation(ClothesBloc().filteredData, eval);
}
