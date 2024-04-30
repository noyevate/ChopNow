import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/controller/login_controller.dart';
import 'package:chopnow/models/login_response_model.dart';
import 'package:chopnow/views/auth/Login/login_page.dart';
import 'package:chopnow/views/auth/verification_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginResponseModel? user;
    final controller = Get.put(LoginController());

    final box = GetStorage();
    String? token = box.read('token');

    if (token != null) {
      user = controller.getUserInfo();
    }

    if (token == null) {
      return const LoginPage();
    } 
    if (user != null && user.verification == false) {
      return const VerificationPage();       
    }

    return Scaffold(
      
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Cart'),
          backgroundColor: Tcolor.textField,
        ),
        body: Text(
          "Cart",
          style: TextStyle(color: Tcolor.secondaryText, fontSize: 20),
        ));
  }
}
