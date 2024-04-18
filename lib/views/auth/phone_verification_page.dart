import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/controller/phone_verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_otp_verification/phone_verification.dart';

class PhoneVerificationPage extends StatelessWidget {
  const PhoneVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PhoneVerificationController());
    return PhoneVerification(
      isFirstPage: false,
      enableLogo: false,
      themeColor: Tcolor.primary,
      backgroundColor: Tcolor.white,
      initialPageText: "Verify Phone Number",
      initialPageTextStyle: TextStyle(
        color: Tcolor.primary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      textColor: Tcolor.Text,
      onSend: (String value) {
        controller.setPhoneNumber = value;
      },
      onVerification: (String value) {
        print('OTP: $value');
      },
    );
  }
}