import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clothes/main.dart';
import 'package:clothes/models/ClothesInfo.dart';
import 'package:clothes/DropdownCategories.dart';
part 'ClothesEvent.dart';
part 'ClothesState.dart';

class ClothesBloc extends Bloc<ClothesEvent, ClothesState> {
  List<ClothesInfo> _data = <ClothesInfo>[];
  List<ClothesInfo> filteredData = <ClothesInfo>[];



  ClothesBloc() :super(ClothesInitialState()) {
    on<ClothesGetEvent>(_onGet);
    on<ClothesFilterEvent>(_onFilter);
    on<ClothesSelectionEvent>(_onSelection);
  }

  void _onGet (ClothesGetEvent event, Emitter<ClothesState> emit) async {
    emit(ClothesLoadingState());
    _data = await db!.parseClotheToClothesInfo(db!.allClotheEntries);
    if (event.category != null && event.category != 'Все') {
      _data = _data.where((cl) => cl.category == event.category).toList();
    }
    //print(_data);
    filteredData = _data;
    emit(ClothesLoadedState());
  }

  void _onFilter(ClothesFilterEvent event, Emitter<ClothesState> emit) {
    emit(ClothesLoadingState());
    filteredData = _data.where((e) => e.name.contains(event.query)).toList();
    //print(filteredData);

    emit(ClothesLoadedState());
  }


  void _onSelection(ClothesSelectionEvent event, Emitter<ClothesState> emit) async {
    emit(ClothesLoadingState());
    /// event.t - температура
    _data.clear();
    /// TO DO algorithm
    var Dropdown = DropdownCategoriesState();
    var categories = Dropdown.categories;
    for(var category in categories){
      int WarmthDifferences = 100;
      var Clothes = await db!.parseClotheToClothesInfo(db!.getCategory(category));
      if (Clothes.isEmpty) {
        continue;
      }
      ClothesInfo ClothesTypeMin = Clothes[0];
      for(var Clothe in Clothes){
        if((event.t-Clothe.warmth).abs()<WarmthDifferences){
          WarmthDifferences = Clothe.warmth;
          ClothesTypeMin = Clothe;
        }
      }
     _data.add(ClothesTypeMin);
    }
    filteredData = _data;
    emit(ClothesLoadedState());
  }

  ///TO DO добавь их к значениям слайдера



}