// ignore_for_file: unused_field, prefer_final_fields

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:chopnow/models/restaurant.dart';
import 'package:chopnow/views/restaurant/directions_page.dart';
import 'package:chopnow/views/restaurant/widgets/restaurant_menu.dart';
import 'package:chopnow/views/restaurant/widgets/xplore_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import 'widgets/restuarant_bottom_bar.dart';
import 'widgets/row_text.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key, required this.restaurant});

  final RestaurantModel? restaurant;

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage>
    with TickerProviderStateMixin {
  late TabController _tabController = TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Tcolor.white,
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 500.h,
                  width: width,
                  child: CachedNetworkImage(
                    imageUrl: widget.restaurant!.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    width: width,
                    height: 80.h,
                    decoration: BoxDecoration(
                      color: Tcolor.primary.withOpacity(0.4),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.r),
                        topLeft: Radius.circular(20.r),
                      ),
                    ),
                    child: RestuarantBottomBar(widget: widget),
                  ),
                ),
                Positioned(
                  top: 60.h,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Ionicons.chevron_back_circle,
                            size: 50.h,
                            color: Tcolor.white,
                          ),
                        ),
                        ReuseableText(
                          title: widget.restaurant!.title,
                          style: TextStyle(
                            color: Tcolor.Text,
                            fontSize: 60.h,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const DirectionsPage());
                          },
                          child: Icon(
                            Ionicons.location,
                            size: 50.h,
                            color: Tcolor.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                children: [
                  const RowText(
                      first: "Distance to Restaurant", second: "2,7km"),
                  SizedBox(
                    height: 20.h,
                  ),
                  const RowText(
                      first: "Estimated Price", second: "\u20A6 ${1500}"),
                  SizedBox(
                    height: 20.h,
                  ),
                  const RowText(first: "Estimated Time", second: "50 min"),
                  const Divider(
                    thickness: 0.7,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                height: 65.h,
                width: width,
                decoration: BoxDecoration(
                    color: Tcolor.gray,
                    borderRadius: BorderRadius.circular(50.r)),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                      color: Tcolor.primary,
                      borderRadius: BorderRadius.circular(50.r)),
                  labelPadding: EdgeInsets.zero,
                  labelColor: Tcolor.white,
                  labelStyle: TextStyle(
                      fontSize: 30.h,
                      color: Tcolor.white,
                      fontWeight: FontWeight.normal),
                  unselectedLabelColor: Tcolor.placeHolder,
                  tabs: [
                    Tab(
                      child: SizedBox(
                        width: width / 2,
                        height: 50.h,
                        child: const Center(
                          child: Text("Menu"),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        width: width / 2,
                        height: 50.h,
                        child: const Center(
                          child: Text("Explore"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SizedBox(
                height: height,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    RestaurantMenuWidget(restaurantId: widget.restaurant!.id),
                    XploreWidget(code: widget.restaurant!.code),
                    //RestaurantMenuWidget(restaurantId: widget.restaurant!.id),
                    
                  ],
                
                ),
                
              ),
              
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
