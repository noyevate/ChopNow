import 'package:get/get.dart';
// ignore_for_file: prefer_final_fields

import 'dart:convert';

import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/api_error.dart';
import 'package:chopnow/models/login_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get_storage/get_storage.dart';
import 'package:chopnow/views/entrypoint.dart';

import 'package:http/http.dart' as http;

class PhoneVerificationController extends GetxController {
  final box = GetStorage();


  String _phone = "";

  String get phone =>_phone;

  set setPhoneNumber(String value) {
    _phone = value;
    
  }
  
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  void verifyPhone() async {
    setLoading = true;
    String accessToken = box.read("token");

    Uri url = Uri.parse("$appBaseUrl/verify_phone/$phone");

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    try {
      var response = await http.get(url, headers: headers); 
      print(response.statusCode);
      if (response.statusCode == 200) {
        LoginResponseModel data = loginResponseModelFromJson(response.body);

        String userId = data.id;
        String userData = jsonEncode(data);

        box.write(userId, userData);
        box.write('token', data.userToken);
        box.write('userId', data.id);
        box.write('verification', data.verification);

        setLoading = false;

        Get.snackbar("You are successfully verified",
            "Bon appétit! Get ready to savor tasty treats with us.",
            colorText: Tcolor.Text,
            backgroundColor: Tcolor.primary,
            icon: const Icon(Ionicons.fast_food_outline));

        Get.offAll(() => MainScreen());
        setLoading = false;

        
      } else {
        var error = apiErrorFromJson(response.body);
        Get.snackbar("Failed to Verify Accout", error.message,
            colorText: Tcolor.white,
            backgroundColor: Tcolor.red,
            icon: const Icon(Icons.error_outline));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}