// ignore_for_file: must_be_immutable

import 'package:chopnow/common/color_extension.dart';
//import 'package:chopnow/common/size.dart';
import 'package:chopnow/controller/tab_index_controller.dart';
import 'package:chopnow/views/cart/cart_page.dart';
import 'package:chopnow/views/home/home_page.dart';
import 'package:chopnow/views/profile/profile_page.dart';
import 'package:chopnow/views/search/search_page.dart';
import 'package:chopnow/views/support/support_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class MainScreen extends StatelessWidget {
   MainScreen({super.key});

  List<Widget> pageList = const  [
    HomePage(),
    SearchPage(),
    SupportPage(),
    CartPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    //hooking the tab controller
    final controller = Get.put(TabIndexController());
    return Obx(() => Scaffold(
      body: Stack(
        children: [
          pageList[controller.tabIndex],
          
          Align(
            alignment: Alignment.bottomCenter,
            child: Theme(data: Theme.of(context).copyWith(canvasColor: Tcolor.primary), 
            child: BottomNavigationBar(
              showSelectedLabels: true,
              showUnselectedLabels: true,
              unselectedIconTheme:  IconThemeData(color: Tcolor.Text),
              //selectedIconTheme: IconThemeData(color: Tcolor.primary),
            
              onTap: (value) {
                controller.setTabIndex = value;
              },
              currentIndex: controller.tabIndex,
              items: 
              const[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
                BottomNavigationBarItem(icon: Icon(Icons.chat_rounded), label: "support"),
                BottomNavigationBarItem(icon: Badge(label:Text("1"), child: Icon(FontAwesome.cart_arrow_down),), label: "cart"),
                 BottomNavigationBarItem(icon: Icon(FontAwesome.user_circle), label: "profile"),
              ])),
          )
        ],
      ),
    ));
  }
}