import 'package:flutter/material.dart';
import 'package:pos_task/models/food.dart';

class FoodRepository {
  static final FoodRepository _instance = FoodRepository._internal();
  factory FoodRepository() => _instance;
  FoodRepository._internal();

  List<Food> _foods = [];

  List<Food> get foods => _foods;

  void setFoods(List<Food> foods) {
    _foods = foods;
  }


}
