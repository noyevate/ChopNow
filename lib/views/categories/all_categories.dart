import 'package:chopnow/common/background_container.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';

import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:chopnow/hooks/fetch_all_categories.dart';
import 'package:chopnow/models/category.dart';
import 'package:chopnow/views/home/widgets/shimmers/food_list_shimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/category_tile.dart';

class AllCategories extends HookWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllCategories();
    List<CategoryModel>? categories = hookResult.data;
    final isLoading = hookResult.isLoading;

    
    return Scaffold(
      appBar: AppBar( 
        elevation: 0,
        backgroundColor: Tcolor.primary,
        title: ReuseableText(title: "Categories",
        style: TextStyle(fontSize: 12, color: Tcolor.Text, fontWeight: FontWeight.w600),
        ),
        ),
        body: BackgroundContainer(
          color: Tcolor.white,
          child: Container(
            padding: EdgeInsets.only(left: 12.w, top: 10.h),
            height: height,
            child: isLoading ? const FoodListShimmer() : ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(categories!.length, (i) {
              CategoryModel category = categories[i];
              //print(category);
              return CategoryTile(category: category); 
            }),
          ),
          ),
        ),
    );
  }
}
