import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common_widget/round_button.dart';
import 'package:chopnow/common_widget/round_textfield.dart';
import 'package:chopnow/views/auth/Login/login_view.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tcolor.secondaryText,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text(
                "Sign Up",
                style: TextStyle(
                  color: Tcolor.Text,
                  fontSize: 30,
                  fontWeight: FontWeight.w800
                ),
              ),
              Text(
                "add your details to signup",
                style: TextStyle(
                  color: Tcolor.Text,
                  fontSize: 15,
                  fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hintText: "Name",
                controller: txtName,
              ),
              const SizedBox(height:25),
              RoundTextfield(
                hintText: "Email",
                controller: txtEmail,
              ),
              const SizedBox(height:25),
              RoundTextfield(
                hintText: "Phone",
                controller: txtMobile,
              ),
              const SizedBox(height:25),
              RoundTextfield(
                hintText: "Address",
                controller: txtAddress,
              ),
              const SizedBox(height:25),
              RoundTextfield(
                hintText: "Password",
                controller: txtPassword,
                obscureText: true,
              ),
              const SizedBox(height:25),
              RoundTextfield(
                hintText: "Confirm Password",
                controller: txtConfirmPassword,
                obscureText: true,
              ),
              const SizedBox(height:25),
              RoundButton(title: "Sign Up", onPressed: (){}),

              TextButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginView()
                  ),
                  );
              }, child: 
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      color: Tcolor.Text,
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                      color: Tcolor.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                    ),
                  )
                ],
              ),
              
              )
            ],
          ),
        ),
      ),
    );
  }
}