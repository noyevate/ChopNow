import 'package:chopnow/common/color_extension.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Tcolor.textField,
      ),
      body: const Center(
        child: Text("Profile Page"),
      ),
    );
  }
  String getTimeOfDay() {
    final now = DateTime.now();
    final hour = now.hour;
    if(hour >= 0 && hour < 12){
      return '🌙';
    } else if(hour >= 12 && hour < 16){
      return '⛅';
    } else {
      return '☀️';
    }
  }
}