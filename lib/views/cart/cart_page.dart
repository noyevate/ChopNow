import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/custom_container.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:chopnow/controller/login_controller.dart';
import 'package:chopnow/hooks/fetch_cart.dart';
import 'package:chopnow/models/cart_model.dart';
import 'package:chopnow/models/login_response_model.dart';
import 'package:chopnow/views/auth/Login/login_page.dart';
import 'package:chopnow/views/auth/verification_page.dart';
import 'package:chopnow/views/cart/widget/cart_tile.dart';
import 'package:chopnow/views/home/widgets/shimmers/food_list_shimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartPage extends HookWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final hookResult = useFetchCart();
    final List<CartResponse> carts = hookResult.data ?? [];
    final isLoading = hookResult.isLoading;
    final apiError = hookResult.error;
    final refetch = hookResult.refetch;

    LoginResponseModel? user;
    final controller = Get.put(LoginController());

    String? token = box.read('token');

    if (token != null) {
      user = controller.getUserInfo();
    }

    if (token == null) {
      return const LoginPage();
    }
    if (user != null && user.verification == false) {
      return const VerificationPage();
    }

    return Scaffold(
      //backgroundColor: Tcolor.placeHolder,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Tcolor.white,
        title: ReuseableText(
            title: "Cart",
            style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: Tcolor.Text),),
      ),
      body: SafeArea(
        
        child: CustomContainer(
          
          containerContent: isLoading ? const FoodListShimmer() : Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SizedBox(
              width: width,
              height: height,
              child: ListView.builder(
                
                itemCount: carts.length,
                
                itemBuilder: (context, i){
                  print(carts.length);
                  var cart = carts[i];
                  return CartTile(refetch: refetch, color:Tcolor.Lightwhite, cart: cart,);
                }
              ),
            ),
          ),
        ),
      ),
    );
  }
}
