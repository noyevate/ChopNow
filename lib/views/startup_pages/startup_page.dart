import 'package:chopnow/views/startup_pages/nextpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class StartupPage extends StatelessWidget {
  const StartupPage({super.key});



  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 7), () {
      Get.off(const NextPage()); // Navigate to the next page after 3 seconds
    });
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/chopnow logo.png',
                  width: 50,
                  height: 50,
                ),
                Image.asset(
                  'assets/img/ChopNow_logo_text.png',
                  width: 100,
                  height: 100,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}