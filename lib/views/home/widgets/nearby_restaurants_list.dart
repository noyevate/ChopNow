import 'package:chopnow/hooks/fetch_restaurants.dart';
import 'package:chopnow/models/restaurant.dart';
import 'package:chopnow/views/home/widgets/restaurant_widget.dart';
import 'package:chopnow/views/home/widgets/shimmers/nearby_restaurant_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NearbyRestaurantsList extends HookWidget {
  const NearbyRestaurantsList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchRestaurants("0987654321");
    List<RestaurantModel>? restaurants = hookResults.data;
    final isLoading = hookResults.isLoading;

    return isLoading ? const RestaurantShimmer() : Container(
      height: 260.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
        child:  ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(restaurants!.length, (i) {
            RestaurantModel restaurant = restaurants[i];
            //return Container();
            //print(restaurants);
            return RestaurantWidget(
              image: restaurant.imageUrl, 
              logo: restaurant.logoUrl, 
              title: restaurant.title, 
              time: restaurant.time, 
              rating: restaurant.ratingCount
            );
          }),
        ),
    );
  }
}