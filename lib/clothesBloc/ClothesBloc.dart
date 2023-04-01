import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clothes/main.dart';
import 'package:clothes/models/ClothesInfo.dart';
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
    if (event.category != null) {
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
    _data = await db!.parseClotheToClothesInfo(db!.allClotheEntries);

    /// event.t - температура
    //_data.clear();
    /// TO DO algorithm
    //if (event.t <= 7)
    //запрос к бд: await db!.parseClotheToClothesInfo(db!.getType("НЕ ШТАНЫ"));
    //возвращает лист ClothesInfo

    filteredData = _data.take(5).toList();
    emit(ClothesLoadedState());
  }
}