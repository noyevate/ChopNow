// ignore_for_file: unused_import

import 'dart:convert';

import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/custom_button.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/common/uidata.dart';
import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:chopnow/controller/food_controller.dart';

import 'package:chopnow/controller/user_location_controller.dart';
import 'package:chopnow/hooks/fetch_restaurant.dart';
import 'package:chopnow/models/api_error.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:chopnow/models/login_response_model.dart';
import 'package:chopnow/models/order_model.dart';
import 'package:chopnow/models/restaurant.dart';
import 'package:chopnow/views/Orders/payment_page.dart';
import 'package:chopnow/views/restaurant/widgets/row_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:chopnow/common/size.dart';


class OrderDetails extends StatefulHookWidget {
  const OrderDetails({
    super.key,
    required this.food,
    required this.preferenceText,
    required this.selectedAdditives,
  });

  final FoodModel food;
  final String preferenceText;
  final List<Additive> selectedAdditives;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.food.restaurant);
     //LoginResponseModel? user;
    final hookResult = useFetchRestaurant(widget.food.restaurant);
    RestaurantModel? restaurants = hookResult.data;
    final controller = Get.put(FoodController());
    final controller2 = Get.put(UserLocationController());
    
    // final loginController = Get.put(LoginController());

    //user = loginController.getUserInfo();
    // controller.loadAdditives(widget.food.additive);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Tcolor.textField,
        centerTitle: true,
        title: ReuseableText(
          title: "Order Details",
          style: TextStyle(
              fontSize: 30.sp, fontWeight: FontWeight.bold, color: Tcolor.Text),
        ),
      ),
      backgroundColor: Tcolor.textField,
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Tcolor.OrderDetails),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SizedBox(
              height: 20.h,
            ),
            Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                Container(
                  height: 160.h,
                  width: width,
                  decoration: BoxDecoration(
                      color: Tcolor.white,
                      borderRadius: BorderRadius.circular(20.r)),
                  child: Container(
                    padding: EdgeInsets.all(4.r),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24.r),
                          child: Image.network(
                            widget.food.imageUrl[0],
                            width: 200.h,
                            height: 200.h,
                            fit: BoxFit.contain,
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
                              title: widget.food.title,
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Tcolor.Text,
                                  fontWeight: FontWeight.w400),
                            ),
                            ReuseableText(
                              title: "Cooking Time: ${widget.food.time}",
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
                                  itemCount: widget.selectedAdditives.length,
                                  itemBuilder: (context, i) {
                                    var additives = widget.selectedAdditives[i];
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
                                            title: additives.title,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Tcolor.primary,
                                                fontWeight: FontWeight.w400),
                                          ),
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
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            Container(
              height: 650.h,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Tcolor.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Stack(
                      children: [
                        ReuseableText(
                            title: restaurants!.title,
                            style:
                                TextStyle(fontSize: 50.sp, color: Tcolor.Text)),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h, right: 10.w),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(300.r),
                              child: Container(
                                color: Tcolor.white,
                                child: Padding(
                                  padding: EdgeInsets.all(2.h),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50.r),
                                    child: Image.network(
                                      restaurants.logoUrl,
                                      fit: BoxFit.cover,
                                      width: 50.w,
                                      height: 50.w,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Column(
                      children: [
                        RowText(
                            first: "Business Hours", second: restaurants.time),
                        const Divider(
                          thickness: 0.7,
                        ),
                        const RowText(
                            first: "Distance to Restaurant", second: "0.5 km"),
                        SizedBox(
                          height: 20.h,
                        ),
                        const RowText(
                            first: "Price to Default Address",
                            second: "\u20A6 1000"),
                        SizedBox(
                          height: 20.h,
                        ),
                        const RowText(
                            first: "Estimated Delivery Time", second: "50 min"),
                        SizedBox(
                          height: 20.h,
                        ),
                        RowText(
                            first: "Order Total",
                            second:
                                "\u20A6 ${((widget.food.price + controller.additivePrice) * controller.count.value)}"),
                        SizedBox(
                          height: 20.h,
                        ),
                        RowText(
                            first: "Grand Total",
                            second:
                                "\u20A6 ${((widget.food.price + controller.additivePrice) * controller.count.value + 1000)}"),
                        SizedBox(
                          height: 20.h,
                        ),
                        const Divider(
                          thickness: 0.7,
                        ),
                        const RowText(first: "Recipient:", second: ""),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30.w),
                          child: SizedBox(
                            height: 40.h,
                            width: width,
                            child: ReuseableText(
                                title: controller2.address,
                                style: TextStyle(
                                  color: Tcolor.Text,
                                  fontSize: 26.sp,
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ReuseableText(
                                title: "phone: ",
                                style: TextStyle(
                                  color: Tcolor.Text,
                                  fontSize: 26.sp,
                                  fontWeight: FontWeight.w500,
                                )),
                            GestureDetector(
                              onTap: () {
                                print("Add phone number");
                                
                              },
                              child: ReuseableText(
                                  title: "Tap to add Phone Number",
                                  style: TextStyle(
                                    color: Tcolor.Text,
                                    fontSize: 26.sp,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.all(30.h),
              child: CustomButton(
                title: "P R O C E E D    T O   P A Y M E N T",
                btnWidth: width / 1.5,
                onTap: () {
                 
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    _getCurrentLocation();

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
  }

  Future<void> _getCurrentLocation() async {
    final controller1 = Get.put(UserLocationController());
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    LatLng currentLocation = LatLng(position.latitude, position.longitude);
    controller1.setPosition(currentLocation);
    print(currentLocation);

    controller1.getUserAddress(currentLocation);
  }


 Future<void> sendOrderToBackend() async {
  final controller = Get.find<FoodController>();
  final controller2 = Get.find<UserLocationController>();

  String foodId = widget.food.id; // Corresponds to foodId in OrderItemSchema
  int quantity = controller.count.value; // Corresponds to quantity in OrderItemSchema
  //double price = widget.food.price + controller.additivePrice; // Corresponds to price in OrderItemSchema
  List<Additive> additives = controller.getSelectedAdditives(); // Corresponds to additives in OrderItemSchema
  

  // Other fields from your backend schema that you may need:
  String userId = ''; // Get the user ID from your authentication system
  //double orderTotal = price * quantity; // Calculate orderTotal based on the food price and quantity
  double deliveryFee = 0; // Set the delivery fee if applicable
  //double grandTotal = orderTotal + deliveryFee; // Calculate grandTotal
  String deliveryAddress = controller2.address; // Get the delivery address from controller2
  String paymentMethod = 'Stripe'; // Set the payment method
  String orderStatus = 'Pending'; // Set the initial order status
  String restaurantId = widget.food.restaurant; // Get the restaurant ID from widget.food.restaurant
  List<double> restaurantCoords = [controller2.position.latitude, controller2.position.longitude]; // Set the restaurant coordinates if available
  List<double> recipientCoords = [128219, 09238308]; // Set the recipient coordinates if available
  String driverId = 'f4r443g3g3g34'; // Set the driver ID if applicable
  int rating = 3; // Set the initial rating
  String feedback = ''; // Set the feedback if applicable
  String promoCode = ''; // Set the promo code if applicable
  double discountAmount = 0; // Set the discount amount if applicable
  String notes = widget.preferenceText; // Set any additional notes

  // Prepare the order item object
  Map<String, dynamic> orderItem = {
    'foodId': foodId,
    'quantity': quantity,
    //'price': price,
    'additives': additives,
    'instruction': notes,
  };

  // Prepare the order object
  // Map<String, dynamic> order = {
  //   'userId': userId,
  //   'orderItems': [orderItem],
  //   'orderTotal': orderTotal,
  //   'deliveryFee': deliveryFee,
  //   'grandTotal': grandTotal,
  //   'deliveryAddress': deliveryAddress,
  //   'paymentMethod': paymentMethod,
  //   'orderStatus': orderStatus,
  //   'restaurantId': restaurantId,
  //   'restaurantCoords': restaurantCoords,
  //   'recipientCoords': recipientCoords,
  //   'driverId': driverId,
  //   'rating': rating,
  //   'feedback': feedback,
  //   'promoCode': promoCode,
  //   'discountAmount': discountAmount,
  //   'notes': notes,
  // };

  // Convert the order object to JSON
  //String orderJson = json.encode(order);

  // Send the order data to the backend
  // Use your preferred HTTP library to send a POST request with the orderJson to your backend API endpoint
  // Example using http package:
  try {
    http.Response response = await http.post(
    Uri.parse("$appBaseUrl/api/orders"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    //body: orderJson,
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
        Get.snackbar("Order Created", "Your Order as been successfully Created",
            colorText: Tcolor.white,
            backgroundColor: Tcolor.purplr,
            icon: const Icon(FontAwesome.suitcase));

        Get.offAll(() => const PaymentPage());
        
    } else {
        // var error = apiErrorFromJson(response.body);
        Get.snackbar("Something went wrong", "sorry we couldn't take yoyr order, please try again",
            colorText: Tcolor.Text,
            backgroundColor: Tcolor.red,
            icon: const Icon(Icons.error_outline));
      }
  } catch (e) {
    debugPrint(e.toString());
  }
  

  // Handle the response from the backend
  // ...
}

}



