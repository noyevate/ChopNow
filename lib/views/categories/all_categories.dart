import 'package:chopnow/common/background_container.dart';
import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/common/uidata.dart';

import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:chopnow/views/categories/category_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        elevation: 0,
        backgroundColor: Tcolor.white,
        title: ReuseableText(title: "Categories",
        style: TextStyle(fontSize: 12, color: Tcolor.Text, fontWeight: FontWeight.w600),
        ),
        ),
        body: BackgroundContainer(
          color: Tcolor.white,
          child: Container(
            padding: EdgeInsets.only(left: 12.w, top: 10.h),
            height: height,
            child: ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(categories.length, (i) {
              var category = categories[i];
              //print(category);
              return ListTile(
                onTap: () {
                  Get.to(() => CategoryPage(),
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
            }),
          ),
          ),
        ),
    );
  }
}