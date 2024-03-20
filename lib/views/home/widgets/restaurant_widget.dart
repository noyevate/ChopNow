import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:flutter_rating_bar/flutter_rating_bar.dart";

class RestaurantWidget extends StatelessWidget {
  const RestaurantWidget(
      {super.key,
      required this.image,
      required this.logo,
      required this.title,
      required this.time,
      required this.rating,
      this.onTap});

  final String image;
  final String logo;
  final String title;
  final String time;
  final String rating;
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
                  child: Stack(
                    children: [
                      ClipRRect(
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
                      Positioned(
                          right: 10.w,
                          top: 10.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.r),
                            child: Container(
                              color: Tcolor.white,
                              child: Padding(
                                padding: EdgeInsets.all(2.h),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.r),
                                  child: Image.asset(
                                    logo,
                                    fit: BoxFit.cover,
                                    width: 20.w,
                                    height: 20.w,
                                  ),
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),

                Padding(padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReuseableText(title: title, style: TextStyle(fontSize: 12, color: Tcolor.Text, fontWeight: FontWeight.w500),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReuseableText(title: "Delivery time", style: TextStyle(fontSize: 10, color: Tcolor.textField, fontWeight: FontWeight.w500),),
                          ReuseableText(title: time, style: TextStyle(fontSize: 9, color: Tcolor.Text, fontWeight: FontWeight.w500),),
                        ],
                      ),
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: 5,
                            itemBuilder: (context, index) =>  Icon(
                              Icons.star,
                              color: Tcolor.primary,
                            ),
                            itemCount: 5,
                            itemSize: 20.h,
                          ),
                          SizedBox(width: 10.w,),
                            
                          ReuseableText(title: rating, style: TextStyle(fontSize: 12, color: Tcolor.textField, fontWeight: FontWeight.w500),),

                        ],
                      )
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
