import 'package:chopnow/common/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoadngWidget extends StatelessWidget {
  const LoadngWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 180),
        child: LottieBuilder.asset("assets/animation/delivery_guy.json", width: width , height: height/2,),
      ),
    );
  }
}