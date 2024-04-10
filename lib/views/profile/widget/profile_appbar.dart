import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Tcolor.white,
      elevation: 0,
      
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/img/flag-for-flag-nigeria-svgrepo-com.svg",
                  width: 30.h,
                  height: 50.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  width: 2.w,
                  height: 30.h,
                  color: Tcolor.placeHolder,
                ),
                SizedBox(
                  width: 10.w,
                ),
                ReuseableText(
                  title: "NGN",
                  style: TextStyle(
                      fontSize: 30.h,
                      fontWeight: FontWeight.normal,
                      color: Tcolor.Text),
                ),
                SizedBox(
                  width: 10.w,
                ),
                GestureDetector(
                  onTap: () {
                    // redirection to settings page
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: 
                      Icon(
                        SimpleLineIcons.settings, size: 34.h,
                      ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
