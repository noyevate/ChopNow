import 'package:chopnow/common/background_container.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/uidata.dart';
import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:chopnow/views/home/widgets/restaurant_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NearbyRestaurants extends StatelessWidget {
  const NearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Tcolor.white,
      title: ReuseableText(title: "Nearby Restaurants", style: TextStyle(fontSize: 13, color: Tcolor.Text, fontWeight: FontWeight.w500)),),

      body: BackgroundContainer(
        color: Tcolor.white,
        child: Padding(
          padding:  EdgeInsets.all(12.h),
          child: ListView(
          scrollDirection: Axis.vertical,
          children: List.generate(restaurants.length, (i) {
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