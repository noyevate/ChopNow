// ignore_for_file: prefer_collection_literals

import 'dart:convert';

import 'package:chopnow/common/background_container.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/custom_button.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:chopnow/controller/address_controller.dart';
import 'package:chopnow/controller/user_location_controller.dart';
import 'package:chopnow/models/address_model.dart';
import 'package:chopnow/views/auth/widget/email_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  late final PageController _pageController = PageController(initialPage: 0);
  final TextEditingController _searchController = TextEditingController();

  final TextEditingController _postalCode = TextEditingController();
  final TextEditingController _instructions = TextEditingController();

  GoogleMapController? _mapController;
  LatLng? _selectedPosition;
  List<dynamic> _placeList = [];
  List<dynamic> _selectedPlace = [];

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String searchQuery) async {
    if (searchQuery.isNotEmpty) {
      final url = Uri.parse(
          "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchQuery&key=$googleApiKey");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          _placeList = json.decode(response.body)['predictions'];
        });
      }
    } else {
      _placeList = [];
    }
  }

  void _getPlaceDetails(String placeId) async {
    final url = Uri.parse(
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$googleApiKey");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final location = json.decode(response.body);
      final lat = location['result']['geometry']['location']['lat'] as double;
      final lng = location['result']['geometry']['location']['lng'] as double;
      final address = location['result']['formatted_address'];

      String postalCode = '';
      final addressComponents = location['result']['address_components'];
      for (var component in addressComponents) {
        if (component['types'].contains('postal_code')) {
          postalCode = component['long_name'];
          break;
        }
      }

      setState(() {
        _selectedPosition = LatLng(lat, lng);
        _searchController.text = address;
        _postalCode.text = postalCode;
        // where you can add the address to another page
        moveToSelectedPosition();
        _placeList = [];
      });
    } else {}
  }

  void moveToSelectedPosition() {
    if (_selectedPosition != null && _mapController != null) {
      _mapController!.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: _selectedPosition!, zoom: 15)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final locationController = Get.put(UserLocationController());
    final addressController = Get.put(AddressController());
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Tcolor.primary,
            elevation: 0,
            centerTitle: true,
            title: const Text("Shipping Address"),
            leading: Obx(
              () => Padding(
                padding: EdgeInsets.only(right: 0.w),
                child: locationController.tabIndex == 0
                    ? IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          AntDesign.closecircleo,
                          color: Tcolor.red,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          locationController.setTabIndex = 0;
                          _pageController.previousPage(
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.easeIn);
                        },
                        icon: const Icon(AntDesign.leftcircleo),
                        color: Tcolor.Text,
                      ),
              ),
            ),
            actions: [
              Obx(() => locationController.tabIndex == 1
                  ? const SizedBox.shrink()
                  : IconButton(
                      onPressed: () {
                        locationController.setTabIndex = 1;
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      icon: Icon(
                        AntDesign.rightcircleo,
                        color: Tcolor.Text,
                      )))
            ]),
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
              Stack(
                children: [
                  GoogleMap(
                    onMapCreated: (GoogleMapController controller) {
                      _mapController = controller;
                    },
                    initialCameraPosition: CameraPosition(
                        target: _selectedPosition ??
                            const LatLng(37.4872418, -122.5996904),
                        zoom: 15),
                    markers: _selectedPosition == null
                        ? Set.of([
                            Marker(
                                markerId: const MarkerId("Your Location"),
                                position:
                                    const LatLng(37.4872418, -122.5996904),
                                draggable: true,
                                onDragEnd: (LatLng position) {
                                  locationController.getUserAddress(position);
                                  setState(() {
                                    _selectedPosition = position;
                                  });
                                })
                          ])
                        : Set.of([
                            Marker(
                                markerId: const MarkerId("Your Location"),
                                position: _selectedPosition!,
                                draggable: true,
                                onDragEnd: (LatLng position) {
                                  locationController.getUserAddress(position);
                                  setState(() {
                                    _selectedPosition = position;
                                  });
                                })
                          ]),
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        color: Tcolor.white,
                        child: TextField(
                          controller: _searchController,
                          onChanged: _onSearchChanged,
                          decoration: InputDecoration(
                            focusColor: Tcolor.Text,
                            hintText: "search your address...",
                          ),
                          style: TextStyle(color: Tcolor.Text),
                        ),
                      ),
                      _placeList.isEmpty
                          ? const SizedBox.shrink()
                          : Expanded(
                              child: ListView(
                                children:
                                    List.generate(_placeList.length, (index) {
                                  return Container(
                                    color: Tcolor.white,
                                    child: ListTile(
                                      visualDensity: VisualDensity.compact,
                                      title: Text(
                                        _placeList[index]['description'],
                                        style: TextStyle(
                                            color: Tcolor.Text,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      onTap: () {
                                        _getPlaceDetails(
                                            _placeList[index]["place_id"]);
                                        _selectedPlace.add(_placeList[index]);
                                      },
                                    ),
                                  );
                                }),
                              ),
                            )
                    ],
                  )
                ],
              ),
              BackgroundContainer(
                color: Tcolor.Lightwhite,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    EmailTextField(
                      controller: _searchController,
                      hintText: "Address",
                      prefixIcon: const Icon(Icons.location_city_rounded),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    EmailTextField(
                      controller: _postalCode,
                      hintText: "Postal Code",
                      prefixIcon: const Icon(Ionicons.location),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    EmailTextField(
                      controller: _instructions,
                      hintText: "Delivery instructions",
                      prefixIcon: const Icon(Ionicons.add_circle_sharp),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReuseableText(
                              title: "Set address as default",
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  color: Tcolor.Text,
                                  fontWeight: FontWeight.w600)),
                          Obx(
                            () => CupertinoSwitch(
                              thumbColor: Tcolor.primary,
                              trackColor: Tcolor.placeHolder,
                              value: locationController.isDefault,
                              onChanged: (value) {
                                locationController.setIsDefault = value;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomButton(
                      title: "S U B M I T",
                      btnHeight: 80.h,
                      onTap: () {
                        if (_searchController.text.isNotEmpty &&
                            _postalCode.text.isNotEmpty &&
                            _instructions.text.isNotEmpty) {
                          AddressModel model = AddressModel(
                            addressLine1: _searchController.text,
                            postalCode: _postalCode.text,
                            addressModelDefault: locationController.isDefault,
                            deliveryInstructions: _instructions.text,
                            latitude: _selectedPosition!.latitude,
                            longitude: _selectedPosition!.longitude,
                          );
                          String data = addressModelToJson(model);
                          addressController.addAddress(data);
                          _searchController.text = "";
                          _postalCode.text = "";
                          _instructions.text = "";

                          
                        } else {
                          Get.snackbar("Fill all fields","Ensure all fields are filled" ,
                              colorText: Tcolor.white,
                              duration: const Duration(seconds: 2),
                              backgroundColor: Tcolor.red,
                              icon: const Icon(Icons.error_outline));
                        }
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
