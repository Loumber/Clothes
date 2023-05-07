import 'dart:async';
import 'dart:math';

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
    if (event.category != null && event.category != 'Всё') {
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
    final _random = new Random();

    /// TO DO algorithm
    var Dropdown = DropdownCategoriesState();
    var categories = Dropdown.categories;
    for(var category in categories){
      var warmthDifferences = 10000;
      var clothes = await db!.parseClotheToClothesInfo(db!.getCategory(category));
      if (clothes.isEmpty) {
        continue;
      }

      List<ClothesInfo> ClothesTypeMin = [];
      for(var clothe in clothes){
        final diff = (event.t - clothe.warmth).abs();
        if(diff < warmthDifferences) {
          warmthDifferences = diff;
          ClothesTypeMin = [clothe];
        } else if (diff == warmthDifferences) {
          ClothesTypeMin.add(clothe);
        }
      }
     _data.add(ClothesTypeMin[_random.nextInt(ClothesTypeMin.length)]);
    }
    filteredData = _data;
    emit(ClothesLoadedState());
  }

  ///TO DO добавь их к значениям слайдера



}