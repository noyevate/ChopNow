import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/common/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderTabs extends StatelessWidget {
  const OrderTabs({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
          height: 70.h,
          width: width,
          decoration: BoxDecoration(
            color: Tcolor.placeHolder,
            borderRadius: BorderRadius.circular(50.r)
          ),
          child: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
              color: Tcolor.Secondary,
              borderRadius: BorderRadius.circular(50.r)
            ),
            labelPadding: EdgeInsets.zero,
            labelColor: Tcolor.Lightwhite,
            labelStyle: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
            dividerColor: Colors.transparent,
            unselectedLabelColor: Tcolor.placeHolder,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
      
            tabs: List.generate(orderList.length, (i) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: TabWidget(title: orderList[i],),
              );
            }),
          ),
        ),
    );
  }
}