// ignore_for_file: unrelated_type_equality_checks

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/custom_button.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/controller/food_controller.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:chopnow/views/restaurant/restaurant_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key, required this.food});

  final FoodModel food;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FoodController());

    return Scaffold(
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50.r),
                ),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 500.h,
                      child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (i) {
                            controller.changePage(i);
                          },
                          itemCount: widget.food.imageUrl.length,
                          itemBuilder: (context, i) {
                            return Container(
                              width: width,
                              height: 500.h,
                              color: Tcolor.placeHolder,
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: widget.food.imageUrl[i],
                              ),
                            );
                          }),
                    ),
                    Positioned(
                        bottom: 10.h,
                        child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Obx(
                              () => Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                      widget.food.imageUrl.length, (index) {
                                    return Container(
                                      margin: EdgeInsets.all(10.h),
                                      width: 15.w,
                                      height: 15.w,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: controller.currentPage == index
                                              ? Tcolor.primary
                                              : Tcolor.placeHolder),
                                    );
                                  },
                                  ),
                                  ),
                            ),
                            ),
                            ),
                    Positioned(
                      top: 80.h,
                      left: 24.w,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Ionicons.chevron_back_circle,
                          color: Tcolor.primary,
                          size: 60.h,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10.h,
                      right: 24.w,
                      child: CustomButton(
                        onTap: () {
                          Get.to(() => const RestaurantPage());
                        },
                        btnWidth: 180.w,
                        title: "Open Restaurant",
                      )
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
