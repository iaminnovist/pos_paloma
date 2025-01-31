part of 'food_bloc.dart';

abstract class FoodEvent {}

class LoadFoods extends FoodEvent {}

class AddFood extends FoodEvent {
  final Food food;
  AddFood(this.food);
}
