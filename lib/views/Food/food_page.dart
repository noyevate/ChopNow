// ignore_for_file: unrelated_type_equality_checks

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/common_textfield.dart';
import 'package:chopnow/common/custom_button.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:chopnow/controller/cart_controller.dart';
import 'package:chopnow/controller/food_controller.dart';
import 'package:chopnow/controller/login_controller.dart';
import 'package:chopnow/hooks/fetch_restaurant.dart';
import 'package:chopnow/models/crt_request_model.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:chopnow/models/login_response_model.dart';
import 'package:chopnow/models/order_request.dart';
import 'package:chopnow/models/restaurant.dart';
import 'package:chopnow/views/Orders/order_page.dart';
import 'package:chopnow/views/auth/Login/login_page.dart';
import 'package:chopnow/views/auth/phone_verification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class FoodPage extends StatefulHookWidget {
  const FoodPage({super.key, required this.food});

  final FoodModel food;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final PageController _pageController = PageController();
  final TextEditingController _preferences = TextEditingController();
  @override
  Widget build(BuildContext context) {
    LoginResponseModel? user;
    final hookResult = useFetchRestaurant(widget.food.restaurant);
    RestaurantModel? restuarant = hookResult.data;
    final controller = Get.put(FoodController());
    final loginController = Get.put(LoginController());
    final cart_controller = Get.put(CartController());

    user = loginController.getUserInfo();
    controller.loadAdditives(widget.food.additive);

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50.r),
            ),
            child: Stack(
              children: [
                SizedBox(
                  height: 500.h,
                  child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (i) {
                        controller.changePage(i);
                      },
                      itemCount: widget.food.imageUrl.length,
                      itemBuilder: (context, i) {
                        return Container(
                          width: width,
                          height: 500.h,
                          color: Tcolor.placeHolder,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: widget.food.imageUrl[i],
                          ),
                        );
                      }),
                ),
                Positioned(
                  bottom: 10.h,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          widget.food.imageUrl.length,
                          (index) {
                            return Container(
                              margin: EdgeInsets.all(10.h),
                              width: 15.w,
                              height: 15.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: controller.currentPage == index
                                      ? Tcolor.primary
                                      : Tcolor.placeHolder),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 80.h,
                  left: 24.w,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Ionicons.chevron_back_circle,
                      color: Tcolor.primary,
                      size: 60.h,
                    ),
                  ),
                ),
                // Positioned(
                //     bottom: 10.h,
                //     right: 24.w,
                //     child: CustomButton(
                //       onTap: () {
                //         Get.to(() => RestaurantPage(
                //               restaurant: hookResult.data,
                //             ));
                //       },
                //       btnWidth: 250.w,
                //       title: "Open Restaurant",
                //     ),)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReuseableText(
                      title: widget.food.title,
                      style: TextStyle(
                          fontSize: 15,
                          color: Tcolor.Text,
                          fontWeight: FontWeight.w600),
                    ),
                    Obx(
                      () => ReuseableText(
                        title:
                            "\u20A6 ${((widget.food.price + controller.additivePrice) * controller.count.value)}",
                        style: TextStyle(
                            fontSize: 15,
                            color: Tcolor.primary,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  widget.food.description,
                  textAlign: TextAlign.justify,
                  maxLines: 8,
                  style: TextStyle(
                      fontSize: 14,
                      color: Tcolor.placeHolder,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 40.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                        List.generate(widget.food.foodTags.length, (index) {
                      final tag = widget.food.foodTags[index];
                      return Container(
                        margin: EdgeInsets.only(right: 10.w),
                        decoration: BoxDecoration(
                            color: Tcolor.primary,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r))),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: ReuseableText(
                              title: tag,
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Tcolor.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                ReuseableText(
                  title: "Additives",
                  style: TextStyle(
                      fontSize: 18,
                      color: Tcolor.Text,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 35.h,
                ),
                Obx(
                  () => Column(
                    children:
                        List.generate(controller.additivesList.length, (index) {
                      final additive = controller.additivesList[index];
                      if (controller.additivesList.isEmpty) {
                        return Container(
                          child: ReuseableText(
                            title: "No Additives",
                            style: TextStyle(
                                fontSize: 40.h,
                                fontWeight: FontWeight.w500,
                                color: Tcolor.Text),
                          ),
                        );
                      } else {
                        return CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          dense: true,
                          activeColor: Tcolor.primary,
                          value: additive.isChecked.value,
                          tristate: false,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ReuseableText(
                                title: additive.title,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Tcolor.Text,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              ReuseableText(
                                title: "\u20A6 ${additive.price}",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Tcolor.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          onChanged: (bool? value) {
                            additive.toggleChecked();
                            controller.getTotalPrice();
                            controller.getList();
                            print(controller.getList());
                          },
                        );
                      }
                    }),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReuseableText(
                      title: "Quantity",
                      style: TextStyle(
                        fontSize: 16,
                        color: Tcolor.Text,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.increment();
                          },
                          child: Icon(
                            AntDesign.pluscircleo,
                            color: Tcolor.Text,
                            size: 50.h,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Obx(
                            () => ReuseableText(
                              title: "${controller.count.value}",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Tcolor.Text,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.decrement();
                          },
                          child: Icon(
                            AntDesign.minuscircleo,
                            color: Tcolor.Text,
                            size: 50.h,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                ReuseableText(
                  title: "Preferences",
                  style: TextStyle(
                      fontSize: 16,
                      color: Tcolor.Text,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 25.h,
                ),
                SizedBox(
                  height: 100.h,
                  child: CustomTextWidget(
                      controller: _preferences,
                      hintText: "add your preferences",
                      maxLines: 3),
                ),
                SizedBox(
                  height: 13.h,
                ),
                Container(
                  height: 80.h,
                  decoration: BoxDecoration(
                      color: Tcolor.primary,
                      borderRadius: BorderRadius.circular(30.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (user == null) {
                            Get.to(() => const LoginPage());
                          } else if (user.phoneVerification == false) {
                            showVerificationSheet(context);
                          } else {
                            int price =
                                (widget.food.price + controller.additivePrice) *
                                    controller.count.value;
                            OrderItem item = OrderItem(
                                foodId: widget.food.id,
                                quantity: controller.count.value,
                                price: price,
                                additives: controller.getList(),
                                instruction: _preferences.text);
                            // create order
                            Get.to(
                                () => OrderPage(
                                      restuarant: restuarant,
                                      food: widget.food,
                                      item: item,
                                    ),
                                transition: Transition.cupertino,
                                duration: const Duration(microseconds: 600));
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: ReuseableText(
                            title: "Place Order",
                            style: TextStyle(
                                fontSize: 17,
                                color: Tcolor.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          int price =
                              (widget.food.price + controller.additivePrice) *
                                  controller.count.value;
                          var data = CartRequest(
                            productId: widget.food.id,
                            additives: controller.getList(),
                            quantity: controller.count.value,
                            totalPrice: price,
                          );
                          String cart = cartRequestToJson(data);

                          cart_controller.addToCart(cart);
                        },
                        child: CircleAvatar(
                          backgroundColor: Tcolor.white,
                          radius: 35.r,
                          child: Icon(
                            Ionicons.cart,
                            color: Tcolor.primary,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showVerificationSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            height: 1000.h,
            width: width,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/img/splash_bg.png"),
                fit: BoxFit.fill,
              ),
              color: Tcolor.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ReuseableText(
                    title: "Verify Your Phone Number",
                    style: TextStyle(
                      fontSize: 15,
                      color: Tcolor.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 660.h,
                    child: Column(
                      children: List.generate(
                        verificationReasons.length,
                        (index) {
                          return ListTile(
                            leading: Icon(
                              Icons.check_circle_outline,
                              color: Tcolor.primary,
                            ),
                            title: Text(
                              verificationReasons[index],
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Tcolor.secondaryText,
                                  fontWeight: FontWeight.normal),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomButton(
                    title: "Verify Phone Number",
                    btnHeight: 70.h,
                    onTap: () {
                      Get.to(() => const PhoneVerificationPage());
                    },
                  ),
                  Container(
                    height: 100.h,
                    color: Tcolor.white,
                    child: SizedBox(
                      height: 59.h,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
