import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ReuseableText(
          title: "Payment Page",
          style: TextStyle(
              fontSize: 30.sp, fontWeight: FontWeight.bold, color: Tcolor.Text),
        ),
      ),
      body: Center(
        child: ReuseableText(
            title: "Payment Page",
            style: TextStyle(
                fontSize: 40.sp,
                fontWeight: FontWeight.w600,
                color: Tcolor.Text)),
      ),
    );
  }
}
