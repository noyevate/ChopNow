// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:chopnow/hooks/fetch_categories.dart';
import 'package:chopnow/models/category.dart';
import 'package:chopnow/views/home/widgets/shimmers/category_shimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category_widget.dart';

class CategoryList extends HookWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchCategories();
    List<CategoryModel>? categoryList = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;

    return isLoading
          ? const CategoryShimmer()
          : Container(
      height: 190.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child:  ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(categoryList!.length, (i) {
                CategoryModel category = categoryList[i];
                //print(category);
                return CategoryWidget(category: category);
              }),
            ), 
    );
  }
}
