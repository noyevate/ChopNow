import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10 ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6, // Assuming there are 5 shimmer placeholders
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              width: 100,
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}
