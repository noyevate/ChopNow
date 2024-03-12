import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 188, 32, 32), // Background color for the next page
      body: Center(
        child: Text(
          'Next Page', // Content of the next page
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
    );
  }
}