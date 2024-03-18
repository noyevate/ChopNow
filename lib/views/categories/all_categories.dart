import 'package:chopnow/common/color_extension.dart';
import 'package:flutter/material.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("All Categories", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Tcolor.Text),),
)
    );
  }
}