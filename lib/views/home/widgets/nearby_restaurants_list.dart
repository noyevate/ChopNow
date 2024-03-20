import 'package:chopnow/common/uidata.dart';
import 'package:chopnow/views/home/widgets/restaurant_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NearbyRestaurantsList extends StatelessWidget {
  const NearbyRestaurantsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(restaurants.length, (i) {
            var restaurant = restaurants[i];
            //return Container();
            //print(restaurants);
            return RestaurantWidget(
              image: restaurant['image'], 
              logo: restaurant['logo'], 
              title: restaurant['name'], 
              time: restaurant['time'], 
              rating: restaurant['rate']
            );
          }),
        ),
    );
  }
}