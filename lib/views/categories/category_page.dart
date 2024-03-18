import 'package:chopnow/common/background_container.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Category Page"),
        backgroundColor: Tcolor.white,
      ),
      body: Column(
        children: [
          BackgroundContainer(color: Tcolor.white,child: Center(
            child: ReuseableText(title: "Categroy Page", style: TextStyle(fontSize: 15, color: Tcolor.Text)),
          ),)
          
        ],
      ),
    );
  }
}