import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:flutter/material.dart';

class RowText extends StatelessWidget {
  const RowText({
    super.key,
    required this.first,
    required this.second,
  });
  final String first;
  final String second;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReuseableText(
          title: first,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Tcolor.Text,
          ),
        ),
        ReuseableText(
          title: second,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Tcolor.Text,
          ),
        ),

      ],
    );
  }
}
