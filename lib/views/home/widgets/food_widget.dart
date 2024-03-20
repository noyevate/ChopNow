import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodWidget extends StatelessWidget {
  const FoodWidget({super.key, required this.image, required this.title, required this.time, required this.price, this.onTap});

  final String image;
  final String title;
  final String time;
  final String price;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: Container(
            width: width * 0.75,
            height: 295.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r), color: Tcolor.white),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: SizedBox(
                      height: 150.h,
                      width: width * 0.8,
                      child: Image.asset(
                        image,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),

                Padding(padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReuseableText(title: title, style: TextStyle(fontSize: 12, color: Tcolor.Text, fontWeight: FontWeight.w600),),
                          ReuseableText(title: " \u20A6$price", style: TextStyle(fontSize: 12, color: Tcolor.primary, fontWeight: FontWeight.w500),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReuseableText(title: "Delivery time", style: TextStyle(fontSize: 10, color: Tcolor.textField, fontWeight: FontWeight.w500),),
                          ReuseableText(title: time, style: TextStyle(fontSize: 9, color: Tcolor.Text, fontWeight: FontWeight.w500),),
                        ],
                      ),
                      
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        );
  }
}