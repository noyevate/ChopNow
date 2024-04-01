import 'package:chopnow/common/size.dart';
import 'package:chopnow/controller/search_controller.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:chopnow/views/home/widgets/food_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());

    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.h, 0),
      height: height,
      child: ListView.builder(
        itemCount: controller.searchResults!.length,
        itemBuilder: (context, i){
          FoodModel food = controller.searchResults![i];
          return FoodTile(food: food);
        }
        ),
    );
  }

}