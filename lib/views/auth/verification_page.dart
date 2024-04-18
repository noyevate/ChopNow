import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/custom_button.dart';
import 'package:chopnow/common/custom_container.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:chopnow/controller/verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put( VerificationController());
    return Scaffold(
      appBar: AppBar(
        title: ReuseableText(
          title: "Please Verify Your Account",
          style: TextStyle(
              fontSize: 30.h, fontWeight: FontWeight.w600, color: Tcolor.Text),
        ),
        centerTitle: true,
        backgroundColor: Tcolor.white,
        elevation: 0,
      ),
      body: CustomContainer(
          containerContent: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: SizedBox(
          height: height,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Image.asset(
                "assets/img/on_boarding_3.png",
                height: 500.h,
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: ReuseableText(
                  title: "Verify your account",
                  style: TextStyle(
                      fontSize: 50.h,
                      fontWeight: FontWeight.w600,
                      color: Tcolor.primary),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Enter the 6-digit code sent to your email, if code no found, check your spam folder.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 30.h,
                    fontWeight: FontWeight.normal,
                    color: Tcolor.gray),
              ),
              SizedBox(
                height: 40.h,
              ),
              OtpTextField(
                numberOfFields: 5,
                borderColor: Tcolor.primary,
                borderWidth: 4.w,
                textStyle: TextStyle(color: Tcolor.Text, fontSize: 24.h,
                fontWeight: FontWeight.w500),
                onCodeChanged: (String code) {
                },
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                onSubmit: (String verificationCode) {
                  controller.setCode = verificationCode;
                }, // end onSubmit
              ),
              SizedBox(
                height: 40.h,
              ),
              CustomButton(
                title: "V E R I F Y   A C C O U N T",
                onTap: () {
                  controller.verificationFunction();
                  
                },
                btnHeight: 70.h,
                btnWidth: width,
              ),
            ],
          ),
        ),
      )),
    );
  }
}

//64766