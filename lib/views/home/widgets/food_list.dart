import 'package:chopnow/common/uidata.dart';
import 'package:chopnow/views/home/widgets/food_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(foods.length, (i) {
          var food = foods[i];
          //print(restaurants);
          return FoodWidget(
              image: food["image"],
              title: food['name'],
              time: food['time'],
              price: food['price'].toString());
        }),
      ),
    );
  }
}
