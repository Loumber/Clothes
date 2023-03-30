import 'package:bloc/bloc.dart';
import 'package:clothes/main.dart';
import 'package:clothes/models/ClothesInfo.dart';
part 'ClothesEvent.dart';
part 'ClothesState.dart';

class ClothesBloc extends Bloc<ClothesEvent, ClothesState> {
  ClothesBloc() :super(ClothesInitialState()) {
    on<ClothesGetEvent>(_onGet);
  }

  void _onGet (ClothesGetEvent event, Emitter<ClothesState> emit) async {
    emit(ClothesLoadingState());
    var allClothes = await db!.parseClotheToClothesInfo(db!.allClotheEntries);
    if (event.category != null) {
      emit(ClothesLoadedState(allClothes.where((cl) => cl.category == event.category).toList()));
    }
    else {
      emit(ClothesLoadedState(allClothes));
    }
  }


}