// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:chopnow/common/uidata.dart';
//import 'package:chopnow/common_widget/category_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category_widget.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 200.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(categories.length, (i) {
            var category = categories[i];
            //print(category);
            return CategoryWidget(  category: category); 
          }),
        )
      
    );
  }
}
