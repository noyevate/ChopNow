// ignore_for_file: prefer_final_fields

import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/api_error.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;

class SearchFoodController extends GetxController {
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  void set setLoading(bool value) {
    _isLoading.value = value;
  }

  RxBool _isTriggered = false.obs;

  bool get isTriggered => _isTriggered.value;

  void set setTrigger(bool value) {
    _isTriggered.value = value;
  }

  List<FoodModel>? searchResults;
  void searchFood(String key) async {
    setLoading = true;

    Uri url = Uri.parse("$appBaseUrl/api/foods/search/$key");
    try {
      var response = await http.get(url);
      print(response.statusCode);
      print (response.body);
      if (response.statusCode == 200) {
        searchResults = foodModelFromJson(response.body);
        setLoading = false;
      } else {
        setLoading = false;
        var error = apiErrorFromJson(response.body);
      }
    } catch (e) {
      setLoading = false;
      debugPrint(e.toString());
      
    }
  }
}