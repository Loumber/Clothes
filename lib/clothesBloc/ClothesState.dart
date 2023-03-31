part of 'ClothesBloc.dart';

abstract class ClothesState { }

class ClothesInitialState extends ClothesState { }

class ClothesLoadingState extends ClothesState { }

class ClothesLoadedState extends ClothesState {
  List<ClothesInfo> clothesInfo;

  ClothesLoadedState(this.clothesInfo);
}