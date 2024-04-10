import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ProfileTileWidget extends StatelessWidget {
  const ProfileTileWidget(
      {super.key, required this.title, required this.icon, this.onTap});

  final String title;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      minLeadingWidth: 0,
      onTap: onTap,
      leading: Icon(icon, size: 40.h,),
      title: ReuseableText(
        title: title,
        style: TextStyle(
            fontSize: 30.h, color: Tcolor.gray, fontWeight: FontWeight.normal),
      ),
      trailing: title != "Settings"
          ? Icon(AntDesign.right, size: 30.h,)
          : SvgPicture.asset(
              "assets/img/flag-for-flag-nigeria-svgrepo-com.svg",
              width: 30.w,
              height: 40.h,
            ),
    );
  }
}
