// ignore_for_file: avoid_print

import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/api_error.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:chopnow/models/hook_models/hook_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;


FetchHook useFetchRestaurantFoods(String id) {
  final food = useState<List<FoodModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    
    isLoading.value = true;

    try {
      final  url = Uri.parse("$appBaseUrl/api/foods/restaurant-food/$id");    
      print(url.toString());
      final response = await http.get(url);
      print(response.statusCode);
      print("Restaurant food lists: ${response.body}");
      if(response.statusCode == 200){
        food.value = foodModelFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
    debugPrint(e.toString());
    
  
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    //Future.delayed(const Duration(seconds: 3));
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }


  return FetchHook(
    data: food.value, 
    isLoading: isLoading.value, 
    error: error.value, 
    refetch: refetch,
  );
}