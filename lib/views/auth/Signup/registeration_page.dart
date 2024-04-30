import 'package:chopnow/common/background_container.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/custom_button.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:chopnow/controller/registration_controller.dart';
import 'package:chopnow/models/registration_model.dart';
import 'package:chopnow/views/auth/widget/email_textfield.dart';
import 'package:chopnow/views/auth/Login/login_page.dart';
import 'package:chopnow/views/auth/widget/password_textfeld.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late final TextEditingController _emailController = TextEditingController();
   late final TextEditingController _passwordController =
      TextEditingController();

  late final TextEditingController _userController = TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegistrationController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Tcolor.primary,
        title: ReuseableText(
            title: "Chop Now",
            style: TextStyle(
                fontSize: 50.h,
                color: Tcolor.Text,
                fontWeight: FontWeight.bold)),
      ),
      body: BackgroundContainer(
        color: Tcolor.Lightwhite,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              height: 700.h,
              child: Lottie.asset(
                "assets/animation/delivery_guy.json",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                children: [
                  EmailTextField(
                    hintText: "Username..",
                    prefixIcon: Icon(
                      CupertinoIcons.profile_circled,
                      size: 40.h,
                      color: Tcolor.placeHolder,
                    ),
                    controller: _userController,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  EmailTextField(
                    hintText: "Enter Email..",
                    prefixIcon: Icon(
                      CupertinoIcons.mail,
                      size: 40.h,
                      color: Tcolor.placeHolder,
                    ),
                    controller: _emailController,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  PasswordTextField(
                    controller: _passwordController,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const LoginPage());
                          },
                          child: ReuseableText(
                            title: "Login",
                            style: TextStyle(
                                fontSize: 24.h,
                                color: Colors.blue,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  CustomButton(
                    title: "R E G I S T E R",
                    onTap: () {
                      if (_emailController.text.isNotEmpty &&
                          _userController.text.isNotEmpty &&
                          _passwordController.text.length >= 8) {
                        RegistrationModel model = RegistrationModel(
                            username: _userController.text,
                            email: _emailController.text,
                            password: _passwordController.text);

                          String data = registrationModelToJson(model);
                        //registration Function
                          controller.registrationFunction(data);

                      }
                    },
                    btnHeight: 70.h,
                    btnWidth: width,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
