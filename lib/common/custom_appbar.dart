import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/controller/user_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String deliverToText;
  final String childText;
  final String image;

  const CustomAppBar({
    Key? key,
    required this.deliverToText,
    required this.childText,
    required this.image,
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize =>
      const Size.fromHeight(60); 
      
}


class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserLocationController());
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: CircleAvatar(
          backgroundColor: Tcolor.white,
          backgroundImage: NetworkImage(widget.image)),
      actions: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              getTimeOfDay(),
              style: const TextStyle(fontSize: 35),
            ),),
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
            Text(
              widget.deliverToText,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Tcolor.primary),
            ),
          
          const SizedBox(
            height: 2,
          ),
          Obx(() => Text(controller.address =="" ?
            widget.childText : controller.address,
            style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.w400, color: Tcolor.Text),
          ),),
          
        ],
      ),
    );
  }
  

  String getTimeOfDay() {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour >= 7 && hour < 16) {
      return '☀️'; // Between 7am and 4pm
    } else if (hour >= 16 && hour < 19) {
      return '⛅'; // Between 4pm and 7pm
    } else {
      return '🌙'; // Between 7pm and 7am
    }
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
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
    final controller = Get.put(UserLocationController());
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    LatLng currentLocation = LatLng(position.latitude, position.longitude);
    controller.setPosition(currentLocation);
    print(currentLocation);

    controller.getUserAddress(currentLocation);
  }
}



