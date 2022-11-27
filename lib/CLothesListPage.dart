import 'package:flutter/material.dart';

import 'CustomColors.dart';


class ClothesListPage extends StatelessWidget {
  //const ClothesListPage({super.key, required this.title});
  const ClothesListPage({super.key});
  //final String title;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //final String title = ModalRoute.of(context)!.settings.arguments as String;
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
       body:

           new ClothesList()

       //Center(
      //   child: Container(
      //     child: Text('ClothesListPage'),
      //   ),
      // ),
    );
  }

}

class ClothesList extends StatefulWidget {
  // const ClothesList(this.title);
  // //ClothesList({Key key}) : super(key: key);
  // final String title;
  //final String description;

  @override
  _ClothesListState createState() => _ClothesListState();
}

class _ClothesListState extends State<ClothesList> {
  //_ClothesListState(this.title);
  final String title = "Верхняя одежда";
  TextEditingController editingController = TextEditingController();

  final duplicateItems = List<ClothesInfo>.generate(10, (i) =>
      i.isEven ? ClothesInfo('Куртка черная', 'категория: куртки', ''): ClothesInfo('Куртка красная', 'категория: куртки', ''));
  var items = <ClothesInfo>[];

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<ClothesInfo> searchList = <ClothesInfo>[];
    searchList.addAll(duplicateItems);
    if(query.isNotEmpty) {
      List<ClothesInfo> listData = <ClothesInfo>[];
      searchList.forEach((item) {
        if(item.contains(query)) {
          listData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(listData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            child: Text(title, style: TextStyle(fontFamily: 'Montserrat', fontSize: 26, color: CustomColors.light_coffee_clr),),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 20.0),
            child: SizedBox(
              width: 300,
              child: TextField(
                style: TextStyle(color: CustomColors.light_coffee_clr),
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: const InputDecoration(
                  suffixStyle: TextStyle(color: CustomColors.light_coffee_clr),
                  labelStyle: TextStyle(color: CustomColors.light_coffee_clr),
                  labelText: "Поиск",
                  prefixIcon: Icon(Icons.search,color: CustomColors.light_coffee_clr,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: CustomColors.light_coffee_clr)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide: BorderSide(color: CustomColors.light_coffee_clr)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide: BorderSide(color: CustomColors.light_coffee_clr)
                  ),
                )
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListCard(items[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  ClothesInfo item;
  ListCard(this.item, {super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        color: CustomColors.light_coffee_clr,
        child: Container(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(13.0, 8.0, 13.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(item.name, style: TextStyle(fontSize: 18),),
                Text(item.category, style: TextStyle(fontSize: 12),),
              ],
            ),
          )
        ),
      ),
    );
  }
}

class ClothesInfo {
  String name;
  String category;
  String description;

  ClothesInfo(this.name, this.category, this.description);

  bool contains(String query) {
    return (name.contains(query)) || (category.contains(query));
  }
}