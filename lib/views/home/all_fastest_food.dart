import 'package:chopnow/common/background_container.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/hooks/fetch_all_food.dart';
import 'package:chopnow/hooks/fetch_foods.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:chopnow/views/home/widgets/food_tile.dart';
import 'package:chopnow/views/home/widgets/shimmers/food_list_shimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FastestFoods extends HookWidget {
  const FastestFoods({super.key});

  @override
  Widget build(BuildContext context) {
    
    final hookResults = useFetchAllFoods("0987654321");
    List<FoodModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      appBar: AppBar(
      title: const Text("Fastest Foods"),),
      body: BackgroundContainer(
        color: Tcolor.white,
        child: isLoading ? const FoodListShimmer() : Padding(
          padding:  EdgeInsets.all(12.h), 
          child: ListView(
          scrollDirection: Axis.vertical,
          children: List.generate(foods!.length, (i) {
            FoodModel food = foods[i];
            //print(restaurants);
            return FoodTile(
              food: food,
            );
          }),
                ),
        ),
      )
    );
  }
}