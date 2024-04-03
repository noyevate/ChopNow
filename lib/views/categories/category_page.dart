import 'package:chopnow/common/background_container.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:chopnow/controller/category_controller.dart';
import 'package:chopnow/hooks/fetch_category_foods.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:chopnow/views/home/widgets/food_tile.dart';
import 'package:chopnow/views/home/widgets/shimmers/food_list_shimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryPage extends HookWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    final hookResults = useFetchFoodsByCategory("0987654321");
    List<FoodModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: ReuseableText(
            title: "${controller.titleValue} Category",
            style: TextStyle(
                fontSize: 13, color: Tcolor.Text, fontWeight: FontWeight.w600)),
        backgroundColor: Tcolor.primary,
        leading: IconButton(
          onPressed: 
            () {
              controller.updateCategory = '';
              controller.updateTitle = '';
              Get.back();
            }, 
          icon: 
            Icon(Icons.arrow_back, color: Tcolor.Text,),
            color: Tcolor.placeHolder, 
        ),
      ),
      body: BackgroundContainer(
        color: Tcolor.white,
        child: SizedBox(
          height: height,
          child: isLoading
              ? const FoodListShimmer()
              : Padding(
                  padding: EdgeInsets.all(12.h),
                  child: ListView(
                    children: List.generate(foods!.length, (i) {
                      FoodModel food = foods[i];
                      //print(restaurants);
                      return FoodTile(
                        food: food,
                      );
                    }),
                  ),
                ),
        ),
      ),
    );
  }
}
