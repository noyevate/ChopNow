import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/custom_button.dart';
import 'package:chopnow/common/custom_container.dart';
import 'package:chopnow/views/profile/widget/profile_appbar.dart';
import 'package:chopnow/views/profile/widget/profile_tile_widget.dart';
import 'package:chopnow/views/profile/widget/user_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tcolor.Lightwhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: const ProfileAppBar(),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              Column(
                children: [
                  const UserInfoWidget(
                      imageUrl:
                          "https://firebasestorage.googleapis.com/v0/b/thetestapp-8449c.appspot.com/o/Icon.jpg?alt=media&token=6e964429-01f2-434d-8032-5f6b7f9fd7df",
                      name: "Usernme",
                      email: "jhsasgaj@gmail.com"),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 420.h,
                    decoration: BoxDecoration(
                      color: Tcolor.white,
                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      //physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ProfileTileWidget(
                          onTap: () {},
                          title: "My Orders",
                          icon: Ionicons.fast_food_outline,
                        ),
                        ProfileTileWidget(
                          onTap: () {},
                          title: "My Favourite Places",
                          icon: Ionicons.heart_outline,
                        ),
                        ProfileTileWidget(
                          onTap: () {},
                          title: "Review",
                          icon: Ionicons.chatbubble_outline,
                        ),
                        ProfileTileWidget(
                          onTap: () {},
                          title: "Coupons",
                          icon: MaterialCommunityIcons.tag,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    height: 420.h,
                    decoration: BoxDecoration(
                      color: Tcolor.white,
                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      //physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ProfileTileWidget(
                          onTap: () {},
                          title: "Shipping Address",
                          icon: SimpleLineIcons.location_pin,
                        ),
                        ProfileTileWidget(
                          onTap: () {},
                          title: "Service Center",
                          icon: AntDesign.customerservice,
                        ),
                        ProfileTileWidget(
                          onTap: () {},
                          title: "Coupons",
                          icon: MaterialIcons.rss_feed,
                        ),
                        ProfileTileWidget(
                          onTap: () {},
                          title: "Settings",
                          icon: AntDesign.setting,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomButton(
                    title: "Logout",
                    raduis: 0,
                    btnColor: Tcolor.primary,
                    onTap: () {},
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
