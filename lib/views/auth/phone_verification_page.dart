import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/controller/phone_verification_controller.dart';
import 'package:chopnow/services/verification_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_otp_verification/phone_verification.dart';

class PhoneVerificationPage extends StatefulWidget {
  const PhoneVerificationPage({super.key});

  @override
  State<PhoneVerificationPage> createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  VerificationService _verificationService = VerificationService();

  String _verificationId = '';
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PhoneVerificationController());
    return Obx(
      () => controller.isLoading == false
          ? PhoneVerification(
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
                _verifyPhoneNumber(value);
              },
              onVerification: (String value) {
                _submitVerificationCode(value);
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  void _verifyPhoneNumber(String phoneNumber) async {
    final controller = Get.put(PhoneVerificationController());
    await _verificationService.verifyPhoneNumber(controller.phone,
        codeSent: (String verificationId, int? resendToken) {
      setState(() {
        _verificationId = verificationId;
      });
    });
  }

  void _submitVerificationCode(String code) async {
    await _verificationService.verifySmsCode(_verificationId, code);
  }
}
