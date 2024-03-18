// ignore_for_file: unused_import

import 'package:chopnow/common/background_container.dart';
import 'package:chopnow/common/custom_appbar.dart';
import 'package:chopnow/common/custom_container.dart';
import 'package:chopnow/views/home/widgets/category_list.dart';
import 'package:flutter/material.dart';
import 'package:chopnow/common/color_extension.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar( // Use your custom app bar
        leftAvatarImageUrl: 'https://fecofoods.com.ng/cook-delicious-amala.png',
        //rightAvatarImageUrl: 'right_avatar_image_url',
        deliverToText: 'Deliver to: ',
        childText: 'No 5, makoko Ave. Lagos',
      ),
      body: SafeArea(child: CustomContainer(containerContent: 
      BackgroundContainer(
        color: Tcolor.white,
        child: const Column(
          children: [
            
            SingleChildScrollView(child: CategoryList())
          ],
        ),
      ),
      ),
      )
    );
  }
}
