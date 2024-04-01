// ignore_for_file: avoid_print

import 'package:chopnow/common/size.dart';
import 'package:chopnow/models/api_error.dart';
import 'package:chopnow/models/hook_models/hook_result.dart';
import 'package:chopnow/models/restaurant.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;


FetchHook useFetchAllRestaurants(String code) {
  final restaurants = useState<List<RestaurantModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      final  url = Uri.parse("$appBaseUrl/api/restaurant/all/$code");    
      print(url.toString());
      final response = await http.get(url);
      
      print(apiError);
      if(response.statusCode == 200){
        restaurants.value = restaurantModelFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      
    error.value = e as Exception;
  
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }


  return FetchHook(
    data: restaurants.value, 
    isLoading: isLoading.value, 
    error: error.value, 
    refetch: refetch,
  );
}