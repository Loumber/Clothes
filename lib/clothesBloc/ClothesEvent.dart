part of 'ClothesBloc.dart';


abstract class ClothesEvent {}

class ClothesGetEvent implements ClothesEvent {
  String? category;
  ClothesGetEvent({this.category}) {}
}


class ClothesFilterEvent implements ClothesEvent {
  String query;
  ClothesFilterEvent(this.query);
}