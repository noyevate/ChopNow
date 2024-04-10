import 'package:chopnow/models/additive_obs.dart';
import 'package:chopnow/models/food_model.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  RxInt currentPage = 0.obs;
  bool initialCheckValue = false;
  var additivesList = <AdditiveObs>[].obs;

  void changePage(int index) {
    currentPage.value = index;
  }

  RxInt count = 1.obs;

  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }

  void loadAdditives(List<Additive>additives) {
    additivesList.clear();

    for(var additiveInfo in additives) {
      var additive = AdditiveObs(
        id: additiveInfo.id, 
        title: additiveInfo.title, 
        price: additiveInfo.price,
        checked: initialCheckValue
      );
      if(additives.length == additivesList.length) {
        
      } else {
        additivesList.add(additive);
        print(additivesList.length);
      }
    }
    
  }
}
