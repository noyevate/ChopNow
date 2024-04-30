import 'package:chopnow/common/color_extension.dart';
import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Support'),
        backgroundColor: Tcolor.textField,
      ),
       body: Center(child: Text("Support", style: TextStyle(color: Tcolor.secondaryText, fontSize: 20),)),
      
    );
  }
}