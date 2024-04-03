import 'package:chopnow/common/background_container.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/hooks/fetch_restaurants.dart';
import 'package:chopnow/models/restaurant.dart';
import 'package:chopnow/views/home/widgets/restaurant_tile.dart';
import 'package:chopnow/views/home/widgets/shimmers/food_list_shimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularRestaurants extends HookWidget {
  const PopularRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchRestaurants("0987654321");
    List<RestaurantModel>? restaurants = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Tcolor.primary,
      title: const Text("Popular Restaurants"),),
      
      body: BackgroundContainer(
        color: Tcolor.white,
        child: Padding(
          padding:  EdgeInsets.all(12.h),
          child: isLoading ? const FoodListShimmer() : ListView(
          scrollDirection: Axis.vertical,
          children: List.generate(restaurants!.length, (i) {
            var restaurant = restaurants[i];
            //print(restaurants);
            return RestaurantTile(
              restaurant: restaurant,
            );
          }),
                ),
        ),
      )
    );
  }
}