import 'package:chopnow/common/background_container.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/uidata.dart';
import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:chopnow/views/home/widgets/food_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Recomendations extends StatelessWidget {
  const Recomendations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: ReuseableText(title: "Recomendations" , style: TextStyle(color: Tcolor.Text, fontSize: 15, fontWeight: FontWeight.w500),),),
      body: BackgroundContainer(
        color: Tcolor.white,
        child: Padding(
          padding:  EdgeInsets.all(12.h),
          child: ListView(
          scrollDirection: Axis.vertical,
          children: List.generate(foods.length, (i) {
            var food = foods[i];
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