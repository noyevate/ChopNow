import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/controller/user_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  late final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserLocationController());
    
    return Scaffold(
      
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Shipping Address"),
          backgroundColor: Tcolor.primary,
          
        ),
        body: SizedBox(
          height: height,
          width: width,
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            pageSnapping: false,
            onPageChanged: (index) {
              _pageController.jumpToPage(index);
            },
            children: [
              const Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(target:  LatLng(8.4872418, 4.5996904),zoom: 15),
                    
                  )
                ],
              ),
              Container(color: Colors.blueGrey)
            ],
          ),
        ));
  }
}
