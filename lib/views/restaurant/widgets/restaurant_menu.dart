import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/hooks/foods_by_restaurants.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:chopnow/views/home/widgets/food_tile.dart';
import 'package:chopnow/views/home/widgets/shimmers/food_list_shimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RestaurantMenuWidget extends HookWidget {
  const RestaurantMenuWidget({super.key, required this.restaurantId});

  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchRestaurantFoods(restaurantId);
    final foods = hookResult.data;
    final isLoading = hookResult.isLoading;

    return Scaffold(
      backgroundColor: Tcolor.white,
      body: isLoading
          ? const FoodListShimmer()
          : SizedBox(
              height: height * 0.7,
              child: ListView(
                padding: EdgeInsets.zero,
                  children: List.generate(foods.length, (index) {
                final FoodModel food = foods[index];
                return FoodTile(food: food);
              }),),
            ),
    );
  }
}
