import 'package:chopnow/hooks/fetch_foods.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:chopnow/views/Food/food_page.dart';
import 'package:chopnow/views/home/widgets/food_widget.dart';
import 'package:chopnow/views/home/widgets/shimmers/nearby_restaurant_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FoodList extends HookWidget {
  const FoodList({Key? key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchFoods("0987654321");
    List<FoodModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;

    return isLoading
        ? const RestaurantShimmer() // Display shimmer while loading
        
            : Container(
                height: 240.h,
                padding: EdgeInsets.only(left: 12.w, top: 10.h),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foods?.length,
                  itemBuilder: (context, index) {
                    FoodModel food = foods![index];
                    return FoodWidget(
                      onTap: () {
                        Get.to(() => FoodPage(food: food));
                      },
                      image: food.imageUrl.isNotEmpty ? food.imageUrl[0] : '', // Adjust this line
                      title: food.title,
                      time: food.time,
                      price: food.price.toString(),
                    );
                  },
                ));
              
            // Display a placeholder if no data is available
  }
}
