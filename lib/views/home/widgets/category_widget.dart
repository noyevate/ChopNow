// ignore_for_file: unused_local_variable, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:chopnow/controller/category_controller.dart';
import 'package:chopnow/models/category.dart';
import 'package:chopnow/views/categories/all_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({
    super.key,
    required this.category,
  });

  CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return GestureDetector(
        onTap: () {
          if (controller.categoryValue == category.id) {
            controller.updateCategory = '';
            controller.updateTitle = '';
          } else if (category.value == 'more') {
            Get.to(() => const AllCategories(),
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds: 3));
          } else {
            controller.updateCategory = category.id;
            controller.updateTitle = category.title;
          }
        },
        child: Obx(
          () => Container(
            margin: EdgeInsets.only(right: 20.w),
            padding: EdgeInsets.only(top: 4.h),
            width: width * 0.19,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(
                  color: controller.categoryValue == category.id
                      ? Tcolor.primary
                      : Tcolor.white,
                  width: 1.5.w),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 120.h,
                  child: Image.network(category.imageUrl),
                ),
                const SizedBox(
                  height: 10,
                ),
                ReuseableText(
                    title: category.title,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Tcolor.Text))
              ],
            ),
          ),
        ));
  }
}
