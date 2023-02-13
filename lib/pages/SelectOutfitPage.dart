import 'package:clothes/models/RouteArguments.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import '../ClothesCard.dart';
import '../CustomColors.dart';
import '../ClothesInfo.dart';

typedef IntCallback = void Function(int);

class SelectOutfitPage extends StatefulWidget {



  @override
  State<StatefulWidget> createState() => SelectOutfitPageState();
}

class SelectOutfitPageState extends State<SelectOutfitPage> {

  int _focusedItem = 0;
  late List<ClothesInfo> itemsList;
  late int cardsCount;

  void DeleteItem(int index) {
    // itemsList.removeAt(index);
    // cardsCount--;
  }

  void ChangeItem(int index) {
    // itemsList.removeAt(index);
    // itemsList.insert(index,ClothesInfo('Обновка', '2', "2",
    //     imageUrl: "https://i.ebayimg.com/00/s/ODAwWDkwMA==/z/HOwAAOSwpRRWmZqH/\$_57.JPG?set_id=880000500F"));
  }

  void CallBackFunc(int index) {
      if (index == 1) {
        setState(() {
          DeleteItem(_focusedItem);
        });
      } else if (index == 2) {
        setState(() {
          ChangeItem(_focusedItem);
        });
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    itemsList = ModalRoute
        .of(context)!
        .settings
        .arguments as List<ClothesInfo>;
    cardsCount = itemsList.length;
    return Scaffold(
      appBar: AppBar(
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
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, MediaQuery
            .of(context)
            .size
            .height / 9, 0, 0),
        child: Column(
          children: [
            Container(
              height: 450,
              // width: 400,
              child: ScrollSnapList(
                itemBuilder: (BuildContext context, int index) {
                  return ClothesCard(itemsList.elementAt(index % cardsCount),
                      CallBackFunc);
                },
                itemSize: 330,
                dynamicItemSize: true,
                itemCount: cardsCount,
                onItemFocus: (int index) => {
                  setState(() {
                    _focusedItem = index;
                })
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
