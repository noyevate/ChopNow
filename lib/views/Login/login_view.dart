import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common_widget/round_button.dart';
import 'package:chopnow/common_widget/round_textfield.dart';
import 'package:chopnow/views/Signup/sigupView.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tcolor.secondaryText,
      body: SingleChildScrollView(
        child: 
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(
                    color: Tcolor.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                "Add your details to login",
                style: TextStyle(
                    color: Tcolor.Text,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
              height: 25,
            ),
            RoundTextfield(
              hintText: "Your Email",
              controller: txtEmail,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 25,
            ),
            RoundTextfield(
              hintText: "Password",
              controller: txtPassword,
              obscureText: true,
            ),
            const SizedBox(
              height: 25,
            ),
            RoundButton(title: "Login", onPressed: (){}),
            
            const SizedBox( height: 40,),

            TextButton(onPressed: (){
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpView()
                  ),
                  );
            }, child: 
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    color: Tcolor.Text,
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  ),          
                ),
                Text(
                  "SignUp",
                  style: TextStyle(
                    color: Tcolor.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  ),
                )
              ],
            )
            )
            ],
          ),
        )
        ),
    );
  }
}