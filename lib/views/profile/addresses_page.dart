import 'package:chopnow/common/background_container.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/custom_button.dart';
import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:chopnow/hooks/fetch_addresses.dart';
import 'package:chopnow/models/address_response.dart';
import 'package:chopnow/views/home/widgets/shimmers/food_list_shimer.dart';
import 'package:chopnow/views/profile/shipping_adress.dart';
import 'package:chopnow/views/profile/widget/address_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Addresses extends HookWidget {
   const Addresses({super.key});

  
  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllAddress();

  final List<AddressResponseModel> addresses = hookResult.data ?? [];
  final isLoading = hookResult.isLoading;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Tcolor.primary,
        centerTitle: true,
        title: ReuseableText(
          title: "Addresses",
          style: TextStyle(
              fontSize: 30.sp, color: Tcolor.Text, fontWeight: FontWeight.bold),
        ),
      ),
      body: BackgroundContainer(
        color: Tcolor.Lightwhite,
        child: Stack(
          children: [

            isLoading ? const FoodListShimmer() : AddressListWidget(addresses: addresses,) ,

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 60.h),
                child: CustomButton(title: "Add Address",btnHeight: 80.h, onTap: () {
                  Get.to(() => const ShippingAddress());
                },),
              ),
            )
          ],
        ),
      ),
    );
  }
}
