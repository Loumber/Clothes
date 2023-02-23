import 'package:clothes/CustomColors.dart';
import 'package:clothes/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownCategories extends StatefulWidget {
  DropdownCategories(Key key) : super(key: key);
  @override
  State<StatefulWidget> createState() => DropdownCategoriesState();
  }

class DropdownCategoriesState extends State<DropdownCategories>{
  List<String> categories = ["Верхняя одежда","Верх","Низ","Аксессуары","Обувь"];
  List<String> outerwearType = ["Жилеты","Куртки","Плащи","Пальто","Пуховики"];
  List<String> topType = ["Кофты","Рубашки и блузки","Пиджаки","Майки и топы","Худи и свитшоты","Футболки и поло","Джемперы и свитеры"];
  List<String> bottomType = ["Трико","Джинсы","Брюки","Шорты","Юбки"];
  List<String> accessoriesType = ["Шапки","Зонты","Кепки","Очки","Варежки","Перчатки"];
  List<String> shoesType = ["Кроссовки","Ботинки","Сапоги","Туфли","Сандали","Сланцы"];
  List<String> types = [];

  String? selectedType;
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Row(
          children: [
            Container(
              width: 130,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: CustomColors.dark_brown_tint2, width: 2.5)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      iconEnabledColor: CustomColors.dark_brown_tint,
                      dropdownColor: Colors.white,
                      focusColor: CustomColors.dark_brown_tint2,
                      hint: Text('Категория', style: TextStyle(fontFamily: 'Nexa',fontSize: 14, color: CustomColors.dark_brown_tint2),),
                      value: selectedCategory,
                      isExpanded: true,
                      style: TextStyle(fontSize: 16, color: CustomColors.dark_brown_tint2),
                      items: categories.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (category) {
                        if (category == categories[0]) {
                          types = outerwearType;
                        } else if (category == categories[1]) {
                          types = topType;
                        } else if (category == categories[2]) {
                          types = bottomType;
                        } else if (category == categories[3]) {
                          types = accessoriesType;
                        } else if (category == categories[4]) {
                          types = shoesType;
                        } else {
                          types = [];
                        }
                        setState(() {
                          selectedType = null;
                          selectedCategory = category;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(width: 10,),

            Container(
              width: 130,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: CustomColors.dark_brown_tint2, width: 2.5)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      iconEnabledColor: CustomColors.dark_brown_tint,
                      iconDisabledColor: CustomColors.dark_brown_tint2,
                      dropdownColor: Colors.white,
                      style: TextStyle(fontSize: 16, fontFamily: 'Nexa', color: CustomColors.dark_brown_tint2),
                      focusColor: CustomColors.dark_coffee_clr,
                      hint: Text('Тип', style: TextStyle(fontSize: 14, fontFamily: 'Montserrat', color: CustomColors.dark_brown_tint2),),
                      value: selectedType,
                      isExpanded: true,
                      items: types.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (type) {
                        setState(() {
                          selectedType = type;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
          ]
        ),
    );
  }

  String? getSelectedCategory() {
    return selectedCategory;
  }

  String? getSelectedType() {
    return selectedType;
  }

  clearSelectedOptions() {
    setState(() {
      selectedCategory = null;
      selectedType = null;
    }
    );
  }


}

