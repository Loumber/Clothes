part of 'ClothesBloc.dart';


abstract class ClothesEvent {}

class ClothesGetEvent implements ClothesEvent {
  String? category;
  ClothesGetEvent({this.category}) {}
}