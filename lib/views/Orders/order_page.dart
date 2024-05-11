import 'package:chopnow/common/background_container.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/custom_button.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:chopnow/controller/address_controller.dart';
import 'package:chopnow/controller/login_controller.dart';
import 'package:chopnow/models/address_response.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:chopnow/models/login_response_model.dart';
import 'package:chopnow/models/order_request.dart';
import 'package:chopnow/models/restaurant.dart';
import 'package:chopnow/views/Orders/widgets/order_tile.dart';
import 'package:chopnow/views/restaurant/widgets/row_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({
    super.key,
    this.restuarant,
    required this.food,
    required this.item,
    required this.address,
  });
  final RestaurantModel? restuarant;
  final FoodModel food;
  final OrderItem item;
  final AddressResponseModel? address;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    LoginResponseModel? user;
    int deliveryFee = 1500;
    String paymentMethod = "Card";
    final loginController = Get.put(LoginController());
    final controller = Get.put(AddressController());

    user = loginController.getUserInfo();
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Tcolor.primary,
          title: ReuseableText(
              title: "Complete Order",
              style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: Tcolor.Text))),
      body: BackgroundContainer(
        color: Tcolor.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(children: [
            SizedBox(height: 20.h),
            OrderTile(
              food: widget.food,
            ),
            widget.restuarant != null ? _buildOrderDetails() : Container(),
            SizedBox(height: 40.h),
            CustomButton(
                title: "P R O C E E D   TO   P A Y M E N T",
                onTap: () {
                  
                  OrderRequest model = OrderRequest(
                      userId: user!.id,
                      orderItems: [widget.item],
                      orderTotal: widget.item.price,
                      deliveryFee: deliveryFee,
                      grandTotal: widget.item.price + deliveryFee,
                      deliveryAddress: widget.address!.addressLine1,
                      restaurantAddress: widget.restuarant!.coords.address,
                      paymentMethod: paymentMethod,
                      restaurantId: widget.restuarant!.id,
                      restaurantCoords: [
                        widget.restuarant!.coords.latitude,
                        widget.restuarant!.coords.longitude
                      ],
                      recipientCoords: [
                        widget.address!.latitude,
                        widget.address!.longitude
                      ],
                      driverId: "723g3g32t783g327gd2tdg23dg2",
                      feedback: widget.item.instruction,
                      promoCode: "73183vh",
                      notes: widget.address!.deliveryInstructions,
                      orderStatus: 'Pending',
                      rating: 5,
                      discountAmount: 1);
                      print(widget.item.price);
                      String data = orderRequestToJson(model);
                      controller.addAddress(data);
                },
                btnWidth: width / 1.2)
          ]),
        ),
      ),
    );
  }

  Widget _buildOrderDetails() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      height: height / 2.5,
      width: width,
      decoration: BoxDecoration(
        color: Tcolor.OrderDetails,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReuseableText(
                title: widget.restuarant!.title,
                style: TextStyle(
                    fontSize: 40.sp,
                    color: Tcolor.Text,
                    fontWeight: FontWeight.bold),
              ),
              CircleAvatar(
                radius: 35.r,
                backgroundColor: Tcolor.white,
                backgroundImage: NetworkImage(widget.restuarant!.logoUrl),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          RowText(first: "Business Hours", second: widget.restuarant!.time),
          const Divider(
            thickness: 1,
          ),
          SizedBox(
            height: 15.h,
          ),
          const RowText(first: "Distance from Restaurant", second: "3 km"),
          SizedBox(
            height: 15.h,
          ),
          const RowText(first: "Estimated time to delivery", second: "30 mins"),
          SizedBox(
            height: 15.h,
          ),
          const RowText(
              first: "Price to default address", second: "\u20A6 ${1500}"),
          SizedBox(
            height: 15.h,
          ),
          RowText(
              first: "Order Total",
              second: "\u20A6 ${widget.item.price.toString()}"),
          SizedBox(
            height: 15.h,
          ),
          RowText(
              first: "Order Grand Total",
              second: "\u20A6 ${widget.item.price + 1500}"),
          const Divider(
            thickness: 1,
          ),
          SizedBox(
            height: 15.h,
          ),
          ReuseableText(
            title: "Additives",
            style: TextStyle(
                fontSize: 40.sp,
                color: Tcolor.Text,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            width: width,
            height: 30.h,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.item.additives.length,
                itemBuilder: (context, i) {
                  String additives = widget.item.additives[i];
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
                        child: ReuseableText(
                          title: additives,
                          style: TextStyle(
                              fontSize: 10,
                              color: Tcolor.primary,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }
}
