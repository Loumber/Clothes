import 'package:clothes/ImageCapture.dart';
import 'package:clothes/clothesBloc/ClothesBloc.dart';
import 'package:clothes/models/ClothesInfo.dart';
import 'package:clothes/DropdownCategories.dart';
import 'package:clothes/main.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:clothes/CustomColors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../database/database.dart';

class EditClothesPage extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<DropdownCategoriesState> myWidgetStateKey = new GlobalKey<
      DropdownCategoriesState>(); // для получения данных о выбранной категории и типе myWidgetStateKey.currentState?.getSelectedCategory() ?? ''
  GlobalKey<ImageCaptureState> photoWidgetStateKey =
      new GlobalKey<ImageCaptureState>();
  bool isInit = false;
  bool initCategories= false;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ClothesInfo item =
        ModalRoute.of(context)!.settings.arguments as ClothesInfo;


    if(!isInit) {
      titleController.text = item.GetName();
      descriptionController.text = item.GetDescription();
      isInit = true;
    }
    else {
      initCategories= true;
    }

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: CustomColors.dark_brown_tint),
        shadowColor: null,
        elevation: 0,
        backgroundColor: CustomColors.light_coffee_clr,
        title: const Text('Clothes', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: CustomColors.dark_brown_tint),),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.77,
              width: MediaQuery.of(context).size.width * 0.95,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(color: CustomColors.light_coffee_tint),
              boxShadow: [
                BoxShadow(
                  color: CustomColors.light_coffee_tint,
                  spreadRadius: 1,
                  blurRadius: 14,
                  blurStyle: BlurStyle.normal,
                )
              ],
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: CustomColors.dark_coffee_clr)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 35.0, 0, 0),
                      child: ImageCapture(photoWidgetStateKey, path: item.imageUrl),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: TextField(
                          cursorColor: CustomColors.dark_brown_tint2,
                          controller: titleController,
                          style: TextStyle(
                              fontSize: 16, color: CustomColors.dark_brown_tint2),
                          decoration: InputDecoration(

                              //labelText: item.GetName(),

                              labelStyle: TextStyle(
                                  fontSize: 16,
                                  color: CustomColors.dark_brown_tint2),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    width: 2.5,
                                    color: CustomColors.dark_brown_tint2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    width: 2.5,
                                    color: CustomColors.dark_brown_tint2),
                              )),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: DropdownCategories(myWidgetStateKey, isInit: initCategories, category: item.GetCategory(), type: item.GetType()),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Container(
                          child: TextField(
                            cursorColor: CustomColors.dark_brown_tint2,
                            controller: descriptionController,
                            minLines: 3,
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 16, color: CustomColors.dark_brown_tint2),
                            decoration: InputDecoration(
                                alignLabelWithHint: true,
                                // labelText: 'Описание',
                                labelStyle: TextStyle(
                                    fontSize: 16,
                                    color: CustomColors.dark_brown_tint2),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      width: 2.5,
                                      color: CustomColors.dark_brown_tint2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 2.5,
                                      color: CustomColors.dark_brown_tint2),
                                  borderRadius: BorderRadius.circular(10.0),
                                )),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(

                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.85 / 2.2,
                            height: 45,
                            decoration: BoxDecoration(
                              color: CustomColors.dark_brown_tint2,
                              border: Border.all(color : CustomColors.dark_brown_tint2, width: 2.5),
                              borderRadius: BorderRadius.circular(20),

                            ),
                            child: Center(
                              child: GestureDetector(
                                onTap: () async {
                                  await db!.DeleteClothes(item.id);
                                  BlocProvider.of<ClothesBloc>(context).add(ClothesGetEvent(category:item.category));
                                  titleController.clear();
                                  photoWidgetStateKey.currentState?.Clear();
                                  descriptionController.clear();
                                  myWidgetStateKey.currentState?.clearSelectedOptions();
                                  Navigator.of(context).pop();


                                },
                                child: Text(
                                  'Удалить',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    //fontWeight: FontWeight.w100,
                                    fontSize: 18,
                                    letterSpacing: 0.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          padding:const EdgeInsets.fromLTRB(20, 20, 5, 0),
                        ),

                        Padding(

                          padding:const EdgeInsets.fromLTRB(5, 20, 20, 0),

                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.85 / 2.2,
                            height: 45,
                            decoration: BoxDecoration(
                              color: CustomColors.dark_brown_tint2,
                              border: Border.all(color : CustomColors.dark_brown_tint2, width: 2.5),
                              borderRadius: BorderRadius.circular(20),

                            ),
                            child: Center(
                              child: GestureDetector(
                                onTap: () async {
                                  if (titleController.value.text.isNotEmpty
                                      && myWidgetStateKey.currentState?.selectedType != null
                                      && myWidgetStateKey.currentState?.selectedCategory != null) {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text('Информация изменена',style: TextStyle(fontFamily: 'Nexa'),),
                                      backgroundColor: CustomColors.dark_brown_tint,
                                    ));
                                    String? path = await photoWidgetStateKey.currentState?.SaveImage("img#${item.id}");
                                    await db!.Update(item.id, titleController.value.text,
                                        descriptionController.value.text,
                                        myWidgetStateKey.currentState?.selectedType as String,
                                        myWidgetStateKey.currentState?.selectedCategory as String,
                                        path as String,
                                        int.parse( db!.ConvertTypeToWarm(myWidgetStateKey.currentState?.selectedType as String))
                                    );
                                    BlocProvider.of<ClothesBloc>(context).add(ClothesGetEvent(category:item.category));
                                    Navigator.of(context).pop();

                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text('Неправильные данные',style: TextStyle(fontFamily: 'Nexa')),
                                      backgroundColor: CustomColors.dark_brown_tint,
                                    ));
                                  }

                                },
                                child: Text(
                                  'Сохранить',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    //fontWeight: FontWeight.w100,
                                    fontSize: 18,
                                    letterSpacing: 0.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
