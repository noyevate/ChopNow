import 'package:get/get.dart';

class TabIndexController extends GetxController {
   // ignore: prefer_final_fields
   RxInt _tabIndex = 0.obs; // making the integer observable

   int get tabIndex => _tabIndex.value;  // getting the getters

   set setTabIndex(int newValue){ //setting the getters
    _tabIndex.value = newValue;
   }

}