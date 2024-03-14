import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common_widget/round_button.dart';
import 'package:chopnow/views/Login/login_view.dart';
import 'package:chopnow/views/Signup/sigupView.dart';
import 'package:flutter/material.dart';


class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Tcolor.secondaryText, // Background color for the next page
      body: Center(
        child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: RoundButton(title: "Login", onPressed:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginView()
                  ),
                  );
                }, 
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: RoundButton(title: "Create Account", onPressed:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpView()
                  ),
                  );
                } ),
              )

            ],
          ),
          
      ),
    );
  }
}