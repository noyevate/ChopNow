// ignore_for_file: must_be_immutable

import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:chopnow/views/categories/category_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryTile extends StatelessWidget {
   CategoryTile({
    super.key,
    required this.category,
  });

   // ignore: prefer_typing_uninitialized_variables
   var category;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(() => const CategoryPage(),
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 100));
      },
      leading: CircleAvatar(
        radius: 50.r,
        backgroundColor: Tcolor.textField,
        child: Image.asset(category['image'], fit: BoxFit.contain,),
        ),
        title: ReuseableText(
          title: category['name'], 
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Tcolor.primaryText)),
          trailing: Icon(Icons.arrow_forward_rounded, color: Tcolor.primary, size: 20.r,),
    );
  }
}