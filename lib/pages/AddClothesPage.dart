
import 'package:clothes/DropdownCategories.dart';
import 'package:clothes/main.dart';
import 'package:flutter/material.dart';
import 'package:clothes/CustomColors.dart';
import '../database/database.dart';

class AddClothesPage extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<DropdownCategoriesState> myWidgetStateKey = new GlobalKey<DropdownCategoriesState>(); // для получения данных о выбранной категории и типе myWidgetStateKey.currentState?.getSelectedCategory() ?? ''


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Container(
            child: SizedBox(
              height: 500,
              width: 330,
              child: Container(
                decoration: BoxDecoration(
                  color: CustomColors.light_coffee_clr,
                  borderRadius: BorderRadius.circular(25.0)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                      child: SizedBox(
                        height: 50,
                        width: 250,
                        child: TextField(
                          controller: titleController,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              color: dark_coffee_clr
                          ),
                          decoration: InputDecoration(
                            labelText: 'Название',
                            labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              color: dark_coffee_clr
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(width: 2, color: dark_coffee_clr),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(width: 2, color: dark_coffee_clr),
                            )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: DropdownCategories(myWidgetStateKey),
                    ),

                    SizedBox(
                      width: 250,
                      height: 150,
                      child: Container(
                        child: TextField(
                          controller: descriptionController,
                          minLines: 5,
                          maxLines: 5,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              color: dark_coffee_clr
                          ),
                          decoration: InputDecoration(
                             alignLabelWithHint: true,
                              labelText: 'Описание',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  color: dark_coffee_clr
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(width: 2, color: dark_coffee_clr),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(width: 2, color: dark_coffee_clr),
                              )
                          ),
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                            padding:EdgeInsets.symmetric(horizontal: 30.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  if (titleController.value.text.isNotEmpty
                                      && myWidgetStateKey.currentState?.selectedType != null
                                      && myWidgetStateKey.currentState?.selectedCategory != null) {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text('Одежда добавлена'),
                                    ));

                                    db!.addClothesFromStrings(titleController.value.text,
                                        myWidgetStateKey.currentState?.selectedType as String,
                                        myWidgetStateKey.currentState?.selectedCategory as String,
                                        descriptionController.value.text,
                                    );

                                    titleController.clear();
                                    descriptionController.clear();
                                    myWidgetStateKey.currentState?.clearSelectedOptions();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text('Неправильные данные')
                                    ));
                                  }

                                },

                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(dark_coffee_clr)
                                ),
                                child: Text('Добавить', style: TextStyle(fontFamily: 'Montserrat', fontSize: 20, color: light_coffee_clr),))
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
        ),
    );
  }
}

