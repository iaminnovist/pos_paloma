
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_task/core/database_helper.dart';
import 'package:pos_task/models/food.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc() : super(FoodInitial()) {
    on<LoadFoods>(_onLoadFoods);
    on<AddFood>(_onAddFood);
  }

  Future<void> _onLoadFoods(LoadFoods event, Emitter<FoodState> emit) async {
    emit(FoodLoading());
    try {
      final foods = await DatabaseHelper.instance.getFoods();
      emit(FoodLoaded(foods));
    } catch (e) {
      emit(FoodError("Failed to load foods"));
    }
  }

  Future<void> _onAddFood(AddFood event, Emitter<FoodState> emit) async {
    try {
      await DatabaseHelper.instance.insertFood(event.food);
      add(LoadFoods()); // Refresh the list
    } catch (e) {
      emit(FoodError("Failed to add food"));
    }
  }
}
