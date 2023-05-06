import 'package:clothes/clothesBloc/ClothesBloc.dart';
import 'package:clothes/main.dart';
import 'package:clothes/models/RouteArguments.dart';
import 'package:clothes/RoutesGenerator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../CustomColors.dart';
import '../models/ClothesInfo.dart';
import '../database/database.dart';

class ClothesListPage extends StatefulWidget {
  //const ClothesListPage({super.key, required this.title});
  const ClothesListPage({super.key});

  @override
  State<ClothesListPage> createState() => _ClothesListPageState();
}

class _ClothesListPageState extends State<ClothesListPage> {
  //final String title;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final RouteArguments arguments = ModalRoute.of(context)!.settings.arguments as RouteArguments;
    BlocProvider.of<ClothesBloc>(context).add(ClothesGetEvent(category: arguments.title));
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: CustomColors.dark_brown_tint
        ),
        shadowColor: null,
        elevation: 0,
        backgroundColor: CustomColors.light_coffee_clr,
        title: Text(arguments.title, style: TextStyle(
            fontSize: 26, fontWeight: FontWeight.bold,
            color: CustomColors.dark_brown_tint),),
      ),
      backgroundColor: Colors.white,
       body: BlocBuilder<ClothesBloc, ClothesState> (
           builder: (context, state) {
             return ClothesList();
           }
         ),

       //Center(
      //   child: Container(
      //     child: Text('ClothesListPage'),
      //   ),
      // ),
    );
  }
}

class ClothesList extends StatefulWidget {
  ClothesList();
  // //ClothesList({Key key}) : super(key: key);
  //final String description;

  @override
  _ClothesListState createState() => _ClothesListState();
}

class _ClothesListState extends State<ClothesList> {
  _ClothesListState() {
  }

  TextEditingController editingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var clBloc = context.watch<ClothesBloc>();

    return  Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            SizedBox(height: 40,),

            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 20.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                    style: TextStyle(color: CustomColors.light_coffee_clr),
                    onChanged: (value) {
                      clBloc.add(ClothesFilterEvent(value));
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
              child: Theme(
                  data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: CustomColors.dark_coffee_clr)),
                  child: (clBloc.state is ClothesLoadedState) ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: clBloc.filteredData.length,
                    itemBuilder: (context, index) {
                      return ListCard(clBloc.filteredData[index]);
                    },
                  ) : Center(child: CircularProgressIndicator())
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
      child: InkWell(
        onTap: () => Navigator.of(context)?.pushNamed(RoutesGenerator.editClothesPage, arguments: item),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          shadowColor: CustomColors.light_coffee_tint,
          elevation: 5,
          color: CustomColors.light_coffee_tint,
          child: Container(
            height: 120,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(13.0, 8.0, 13.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(item.name, style: TextStyle( fontSize: 22, color: CustomColors.dark_brown_tint),),
                      Text("Тип: ${item.type}", style: TextStyle( fontSize: 12, color: CustomColors.dark_brown_tint),),
                    ],
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.0),
                      image: DecorationImage(image: NetworkImage(item.imageUrl),
                          fit: BoxFit.cover
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}

