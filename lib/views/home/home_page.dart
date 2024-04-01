// ignore_for_file: unused_import

import 'package:chopnow/common/background_container.dart';
import 'package:chopnow/common/custom_appbar.dart';
import 'package:chopnow/common/custom_container.dart';
import 'package:chopnow/common/heading.dart';
import 'package:chopnow/controller/category_controller.dart';
import 'package:chopnow/views/home/all_fastest_food.dart';
import 'package:chopnow/views/home/recommendations_page.dart';
import 'package:chopnow/views/home/nearby_restaurants.dart';
import 'package:chopnow/views/home/popular_restaurant.dart';
import 'package:chopnow/views/home/widgets/category_foods_list.dart';
import 'package:chopnow/views/home/widgets/category_list.dart';
import 'package:chopnow/views/home/widgets/food_list.dart';
import 'package:flutter/material.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/views/home/widgets/nearby_restaurants_list.dart';
import 'package:get/get.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return  Scaffold(
      appBar: const CustomAppBar( // Use your custom app bar
        //leftAvatarImageUrl: 'https://fecofoods.com.ng/cook-delicious-amala.png',
        //rightAvatarImageUrl: 'right_avatar_image_url',
        deliverToText: 'Deliver to: ',
        childText: 'No 5, makoko Ave. Lagos',
      ),
      body: SafeArea(child: CustomContainer(containerContent: 
      BackgroundContainer(
        color: Tcolor.white,
        child: Column(
          children: [
            
            const CategoryList(),
            Obx(() => controller.categoryValue == "" ? Column(
              children: [
                
  
                Heading(title: "Popular Restaurants", onTap: () {
                  Get.to(() => const PopularRestaurants(),
                  transition: Transition.cupertino,
                  duration: const Duration(milliseconds: 600));
                },
                ),
                const NearbyRestaurantsList(),
       
                        
                Heading(title: "Nearby Restaurants", onTap: () {
                  Get.to(() => const NearbyRestaurants(),
                  transition: Transition.cupertino,
                  duration: const Duration(milliseconds: 600));
                },
                ),
                const NearbyRestaurantsList(),
                
                Heading(title: "Venture into New Tastes", onTap: () {
                              Get.to(() => const Recomendations(),
                              transition: Transition.cupertino,
                              duration: const Duration(milliseconds: 600));
                            },
                            ),
                            const FoodList(),
                Heading(title: "Fastest Foods", onTap: () {
                  Get.to(() => const FastestFoods(),
                  transition: Transition.cupertino,
                  duration: const Duration(milliseconds: 600));
                },
                ),
                const FoodList(),
              ],
            ) : CustomContainer(
              containerContent: 
              Column(
                children: [
                  Heading(
                    more: true,
                    title: "Explore ${controller.titleValue} Category", onTap: () {
                  Get.to(() => const PopularRestaurants(),
                  transition: Transition.cupertino,
                  duration: const Duration(milliseconds: 600));
                },
                ),
                const CategoryFoodsList(),
                ],
              )
            ),
            )
          ],     
        ),
      ),
      ),
      )
    );
  }
}
