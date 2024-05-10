import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:chopnow/controller/cart_controller.dart';
import 'package:chopnow/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, this.color, required this.cart, this.refetch});

  final CartResponse cart;
  final Color? color;
  final Function()? refetch;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return GestureDetector(
      onTap: () {
        // Get.to(() => FoodPage(food: food));
      },
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            height: 160.h,
            width: width,
            decoration: BoxDecoration(
                color: color ?? Tcolor.placeHolder,
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
                            cart.productId.imageUrl[0],
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
                        title: cart.productId.title,
                        style: TextStyle(
                            fontSize: 13,
                            color: Tcolor.Text,
                            fontWeight: FontWeight.w400),
                      ),
                      ReuseableText(
                        title: "Quantity: ${cart.quantity}",
                        style: TextStyle(
                            fontSize: 13,
                            color: Tcolor.secondaryText,
                            fontWeight: FontWeight.w400),
                      ),
                      
                      SizedBox(
                        width: width * 0.7,
                        height: 30.h,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: cart.additives.length,
                            itemBuilder: (context, i) {
                              var additive = cart.additives[i];
                              return Container(
                                margin: EdgeInsets.only(right: 10.w),
                                decoration: BoxDecoration(
                                  color: Tcolor.placeHolder,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.r),
                                  ),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(4.h),
                                    child: ReuseableText(title: additive, style: TextStyle(
                                      fontSize: 10,color: Tcolor.primary, fontWeight: FontWeight.w400
                                    ),),
                                  ),
                                ),
                              );
                            }),
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
              width: 120.w,
              height: 30.h,
              decoration: BoxDecoration(
                  color: Tcolor.Secondary,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Center(
                child: ReuseableText(
                  title: "\u20A6${cart.totalPrice.toString()}",
                  style: TextStyle(
                      fontSize: 12,
                      color: Tcolor.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Positioned(
            right: 150.w,
            top: 3.h,
            child: GestureDetector(
              onTap: () {

                controller.removeFromCart(cart.id, refetch!);
              },
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                    color: Tcolor.red,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Center(
                  child: Icon(
                    MaterialCommunityIcons.trash_can,
                    size: 40.h,
                    color: Tcolor.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
