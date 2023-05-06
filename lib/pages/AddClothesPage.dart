
import 'package:clothes/DropdownCategories.dart';
import 'package:clothes/ImageCapture.dart';
import 'package:clothes/main.dart';
import 'package:flutter/material.dart';
import 'package:clothes/CustomColors.dart';
import 'package:clothes/database/database.dart';
import '../database/database.dart';

class AddClothesPage extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<DropdownCategoriesState> myWidgetStateKey = new GlobalKey<DropdownCategoriesState>(); // для получения данных о выбранной категории и типе myWidgetStateKey.currentState?.getSelectedCategory() ?? ''
  GlobalKey<ImageCaptureState> photoWidgetStateKey = new GlobalKey<ImageCaptureState>(); // для получения данных о photo myWidgetStateKey.currentState?.getSelectedCategory() ?? ''


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Container(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              width: 350,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(color: CustomColors.light_coffee_tint),
                  boxShadow: [BoxShadow(
                    color: CustomColors.light_coffee_tint,
                    spreadRadius: 1,
                    blurRadius: 14,
                    blurStyle: BlurStyle.normal,

                  )],
                ),
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                            child: ImageCapture(photoWidgetStateKey),
                        ),


                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: SizedBox(
                            height: 50,
                            width: 270,
                            child: TextField(
                              cursorColor: CustomColors.dark_brown_tint2,
                              controller: titleController,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: CustomColors.dark_brown_tint2
                              ),
                              //maxLength: 10,

                              decoration: InputDecoration(
                                labelText: 'Название',

                                labelStyle: TextStyle(
                                  fontSize: 16,
                                  color: CustomColors.dark_brown_tint2
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(width: 2.5, color: CustomColors.dark_brown_tint2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(width: 2.5, color: CustomColors.dark_brown_tint2),
                                )
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: SizedBox(
                            width: 270,
                            child: DropdownCategories(myWidgetStateKey),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                          child: SizedBox(
                            width: 270,
                            //height: 100,
                            child: Container(
                              child: TextField(
                                cursorColor: CustomColors.dark_brown_tint2,
                                controller: descriptionController,
                                minLines: 3,
                                maxLines: 3,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: CustomColors.dark_brown_tint2
                                ),
                                decoration: InputDecoration(
                                   alignLabelWithHint: true,
                                    labelText: 'Описание',
                                    labelStyle: TextStyle(
                                        fontSize: 16,
                                        color: CustomColors.dark_brown_tint2
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(width: 2.5, color: CustomColors.dark_brown_tint2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(width: 2.5, color: CustomColors.dark_brown_tint2),
                                      borderRadius: BorderRadius.circular(10.0),
                                    )
                                ),
                                textInputAction: TextInputAction.done,
                              ),
                            ),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(

                                child: Container(
                                  width: 125,
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
                                            content: Text('Одежда добавлена',style: TextStyle(fontFamily: 'Nexa'),),
                                            backgroundColor: CustomColors.dark_brown_tint,
                                          ));

                                          db!.addClothesFromStrings(titleController.value.text,
                                            myWidgetStateKey.currentState?.selectedCategory as String,
                                            myWidgetStateKey.currentState?.selectedType as String,
                                            descriptionController.value.text,
                                            db!.ConvertTypeToWarm(myWidgetStateKey.currentState?.selectedType as String),

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
                                        'Добавить',
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
                                padding:const EdgeInsets.fromLTRB(0, 20, 40, 0),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
        ),
    );
  }
}

