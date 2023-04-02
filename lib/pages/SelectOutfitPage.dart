import 'package:clothes/clothesBloc/ClothesBloc.dart';
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

typedef IntCallback = void Function(int);

class SelectOutfitPageWrapper extends StatelessWidget {
  const SelectOutfitPageWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t = ModalRoute.of(context)!.settings.arguments as int;
    return BlocProvider<ClothesBloc>(
      create: (context) => ClothesBloc()
        ..add(ClothesSelectionEvent(
            t)),
      child: SelectOutfitPage(),
    );
  }
}

class SelectOutfitPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SelectOutfitPageState();
}

class SelectOutfitPageState extends State<SelectOutfitPage> {
  //WalkButton
  String walkButtonText = 'Начать прогулку';
  int walkButtonTapCounter = 0;
  var walkButtonTextColor = CustomColors.dark_brown_tint;
  var walkButtonBackColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
          var clBloc =  BlocProvider.of<ClothesBloc>(context);
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
                                return EvalationWindow();
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
    );
  }
}

class EvalationWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.white,
        insetPadding: EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.30,
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
                    EvalationSlider(),
                    SizedBox(height: 15),
                    Container(
                      width: 125,
                      height: 45,
                      decoration: BoxDecoration(
                        color: CustomColors.dark_brown_tint2,
                        border: Border.all(
                            color: CustomColors.dark_brown_tint2, width: 2.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)?.pushNamed(
                              RoutesGenerator.homePage,
                              arguments: GenerateList());
                        },
                        child: Text(
                          "Оценить",
                          style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 0.0,
                            color: Colors.white,
                          ),
                        ),
                      )),
                    ),
                  ],
                )),
          ],
        ));
  }
}
