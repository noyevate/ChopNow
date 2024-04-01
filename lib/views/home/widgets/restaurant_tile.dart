import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:chopnow/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({super.key, required this.restaurant});

  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            height: 160.h,
            width: width,
            decoration: BoxDecoration(
                color: Tcolor.placeHolder,
                borderRadius: BorderRadius.circular(20.r)),
            child: Container(
              padding: EdgeInsets.all(4.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(24.r)),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: Image.network(
                            restaurant.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            child: Container(
                              padding: EdgeInsets.only(left: 6.w, bottom: 2.h),
                              color: Tcolor.secondaryText,
                              height: 32.h,
                              width: width,
                              child: RatingBarIndicator(
                                rating: 5,
                                itemCount: 5,
                                itemBuilder: (context, i) => Icon(
                                  Icons.star,
                                  color: Tcolor.primary,
                                ),
                                itemSize: 25.h,
                              ),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReuseableText(
                          title: restaurant.title,
                          style: TextStyle(
                              fontSize: 13,
                              color: Tcolor.Text,
                              fontWeight: FontWeight.w400)),
                      ReuseableText(
                          title: "Delivery time: ${restaurant.time}",
                          style: TextStyle(
                              fontSize: 13,
                              color: Tcolor.secondaryText,
                              fontWeight: FontWeight.w400)),
                      SizedBox(
                        width: width * 0.7,
                        child: Text(
                          restaurant.coords.address,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Tcolor.secondaryText),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
              right: 5.w,
              top: 6.h,
              child: Container(
                width: 80.w,
                height: 30.h,
                decoration: BoxDecoration(
                    color: restaurant.isAvailabe == true ||
                            restaurant.isAvailabe == null
                        ? Tcolor.primary
                        : Tcolor.red,
                        borderRadius: BorderRadius.circular(10.r)),
                        child: Center(child: ReuseableText(title: restaurant.isAvailabe == true ||
                            restaurant.isAvailabe == null ? "Open" : "Closed", style: TextStyle(fontSize: 12, color: Tcolor.white, fontWeight: FontWeight.w600))),
              ))
        ],
      ),
    );
  }
}
