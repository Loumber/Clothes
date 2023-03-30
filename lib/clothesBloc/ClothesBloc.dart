import 'package:bloc/bloc.dart';
part 'ClothesEvent.dart';
part 'ClothesState.dart';

class ClothesBloc extends Bloc<ClothesEvent, ClothesState> {
  ClothesBloc() :super(ClothesInitialState()) {
    on<ClothesGetEvent>(_onGet);
  }

  void _onGet (ClothesGetEvent event, Emitter<ClothesState> emitter) {

  }


}