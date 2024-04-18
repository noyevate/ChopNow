import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/custom_button.dart';
import 'package:chopnow/common/custom_container.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/controller/login_controller.dart';
import 'package:chopnow/models/login_response_model.dart';
import 'package:chopnow/views/auth/Login/login_page.dart';
import 'package:chopnow/views/auth/verification_page.dart';
import 'package:chopnow/views/profile/widget/profile_appbar.dart';
import 'package:chopnow/views/profile/widget/profile_tile_widget.dart';
import 'package:chopnow/views/profile/widget/user_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginResponseModel? user;
    final controller = Get.put(LoginController());

    final box = GetStorage();
    String? token = box.read('token');

    if (token != null) {
      user = controller.getUserInfo();

      print(user!.email);
    }

    if(token == null){
      return const LoginPage();
    }
    if (user != null && user.verification == false) {
      return const VerificationPage();       
    }
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.h),
                    child: UserInfoWidget(
                        imageUrl:
                            "https://firebasestorage.googleapis.com/v0/b/thetestapp-8449c.appspot.com/o/Icon.jpg?alt=media&token=6e964429-01f2-434d-8032-5f6b7f9fd7df",
                        name: user!.username,
                        email: user!.email,
                        user: user,),
                        
                  ),
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
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ProfileTileWidget(
                          onTap: () {
                            Get.to(() => const LoginPage());
                          },
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
                    raduis: 20.r,
                    btnColor: Tcolor.primary,
                    onTap: () {
                      controller.logout();
                    },
                    btnHeight: 70.h,
                    btnWidth: width/2,
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
