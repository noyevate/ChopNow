// ignore_for_file: unused_import

import 'package:chopnow/common/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:chopnow/common/color_extension.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar( // Use your custom app bar
        leftAvatarImageUrl: 'https://fecofoods.com.ng/cook-delicious-amala.png',
        //rightAvatarImageUrl: 'right_avatar_image_url',
        deliverToText: 'Deliver to: ',
        childText: 'No 5, makoko Ave. Lagos',
      ),
      body: Center(
        child: Text("HomePage"),
      ),
    );
  }
}
