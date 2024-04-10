import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/custom_button.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/views/restaurant/rating_page.dart';
import 'package:chopnow/views/restaurant/restaurant_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RestuarantBottomBar extends StatelessWidget {
  const RestuarantBottomBar({
    super.key,
    required this.widget,
  });

  final RestaurantPage widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RatingBarIndicator(
          itemCount: 5,
          itemSize: 50.h,
          rating: widget.restaurant!.rating.toDouble(),
          itemBuilder: (context, i) => const Icon(
            Icons.star,
            color: Colors.yellow,
          ),
        ),
        CustomButton(
          onTap: () {
            Get.to(() => const RatingPage());
          },
          btnColor: Tcolor.purplr,
          btnWidth: width / 3,
          title: "Rate Restaurant",
        )
      ],
    );
  }
}
