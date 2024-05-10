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
        
      }
    }
    
  }
  List<Additive> getSelectedAdditives() {
  return additivesList
      .where((additive) => additive.isChecked.value)
      .map((additive) => Additive(
            id: additive.id,
            title: additive.title,
            price: additive.price,
          ))
      .toList();
  }
   

  List<String> getList() {
    List<String>ads = [];
    for(var additive in additivesList) {
      if(additive.isChecked.value && !ads.contains(additive.title)) {
        ads.add(additive.title);
      } else if(!additive.isChecked.value && !ads.contains(additive.title)) {
        ads.remove(additive.title);
      }
    }
    return ads;
  }


  RxInt _totalPrice = 0.obs;

  int get additivePrice => _totalPrice.value;
  set setTotalPrice(int newPrice) {
    _totalPrice.value = newPrice;
  }


  int getTotalPrice() {
    int totalPrice = 0;
    for(var additive in additivesList) {
      if(additive.isChecked.value){
        totalPrice += int.tryParse(additive.price) ?? 0;
      }
    }
    setTotalPrice = totalPrice;
    return totalPrice;
  }

  
}
