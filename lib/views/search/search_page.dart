// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/common_textfield.dart';
import 'package:chopnow/common/custom_container.dart';
import 'package:chopnow/controller/search_controller.dart';
import 'package:chopnow/views/home/widgets/shimmers/food_list_shimer.dart';
import 'package:chopnow/views/search/loading_widhet.dart';
import 'package:chopnow/views/search/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());

    return Obx(
      () => Scaffold(
          backgroundColor: Tcolor.white,
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            toolbarHeight: 100.h,
            automaticallyImplyLeading: false,
            backgroundColor: Tcolor.white,
            title: Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: CustomTextWidget(
                
                controller: _searchController,
                hintText: "Search for foods...",
                keyboardType: TextInputType.text,
                suffixIcon: GestureDetector(
                    onTap: () {
                      if(controller.isTriggered == false) {
                        controller.searchFood(_searchController.text);
                        controller.setTrigger = true;
                      } else {
                        controller.searchResults = null;
                        controller.setTrigger = false;
                        _searchController.clear();
                      }
                      
                    },
                    child: controller.isTriggered == false ?  Icon(
                      Ionicons.search_circle,
                      size: 70.h,
                      color: Tcolor.secondaryText,
                    ) : Icon(
                      Ionicons.close_circle,
                      size: 70.h,
                      color: Tcolor.red,
                    ),
                    ),
              ),
            ),
            
          ),
          body: SafeArea(
              child: CustomContainer(
                  containerContent: controller.isLoading
                      ? const FoodListShimmer()
                      : controller.searchResults == null
                          ? const LoadngWidget()
                          : const SearchResult(),
                        ),
        ),
      ),
    );
  }
}
