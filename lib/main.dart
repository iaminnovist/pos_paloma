import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_task/app.dart';
import 'package:pos_task/feature/addCart/cart/food_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FoodBloc()),
      ],
      child: App(),
    ),
  );
}
