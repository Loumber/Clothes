import 'package:clothes/ImageCapture.dart';
import 'package:clothes/models/ClothesInfo.dart';
import 'package:clothes/DropdownCategories.dart';
import 'package:clothes/main.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:clothes/CustomColors.dart';
import '../database/database.dart';

class EditClothesPage extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<DropdownCategoriesState> myWidgetStateKey = new GlobalKey<
      DropdownCategoriesState>(); // для получения данных о выбранной категории и типе myWidgetStateKey.currentState?.getSelectedCategory() ?? ''
  GlobalKey<ImageCaptureState> photoWidgetStateKey =
      new GlobalKey<ImageCaptureState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ClothesInfo item =
        ModalRoute.of(context)!.settings.arguments as ClothesInfo;
    titleController.text = item.GetName();
    descriptionController.text = item.GetDescription();



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
          height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.9,
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 25.0, 0, 0),
                    child: ImageCapture(photoWidgetStateKey, path: item.imageUrl),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 0),
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.75,
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
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: DropdownCategories(myWidgetStateKey, category: item.GetCategory(), type: item.GetType()),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
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
                          width: MediaQuery.of(context).size.width * 0.75 / 2.2,
                          height: 45,
                          decoration: BoxDecoration(
                            color: CustomColors.dark_brown_tint2,
                            border: Border.all(color : CustomColors.dark_brown_tint2, width: 2.5),
                            borderRadius: BorderRadius.circular(20),

                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {

                                photoWidgetStateKey.currentState?.SaveImage();
                                titleController.clear();
                                photoWidgetStateKey.currentState?.Clear();
                                descriptionController.clear();
                                myWidgetStateKey.currentState?.clearSelectedOptions();


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
                        padding:const EdgeInsets.fromLTRB(20, 20, 0, 0),
                      ),

                      Padding(

                        padding:const EdgeInsets.fromLTRB(0, 20, 20, 0),

                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.75 / 2.2,
                          height: 45,
                          decoration: BoxDecoration(
                            color: CustomColors.dark_brown_tint2,
                            border: Border.all(color : CustomColors.dark_brown_tint2, width: 2.5),
                            borderRadius: BorderRadius.circular(20),

                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                if (titleController.value.text.isNotEmpty
                                    && myWidgetStateKey.currentState?.selectedType != null
                                    && myWidgetStateKey.currentState?.selectedCategory != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text('Информация изменена',style: TextStyle(fontFamily: 'Nexa'),),
                                    backgroundColor: CustomColors.dark_brown_tint,
                                  ));

                                    db!.addClothesFromStrings(titleController.value.text,
                                            myWidgetStateKey.currentState?.selectedCategory as String,
                                            myWidgetStateKey.currentState?.selectedType as String,
                                            descriptionController.value.text,
                                            db!.ConvertTypeToWarm(myWidgetStateKey.currentState?.selectedType as String),
                                            null
                                          );
                                  photoWidgetStateKey.currentState?.SaveImage();
                                  titleController.clear();
                                  photoWidgetStateKey.currentState?.Clear();
                                  descriptionController.clear();
                                  myWidgetStateKey.currentState?.clearSelectedOptions();
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
        )),
      ),
    );
  }
}
