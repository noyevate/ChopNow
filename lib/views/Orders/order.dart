import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common/size.dart';
import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/order_tabs.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> with TickerProviderStateMixin{
  late final TabController _tabController = TabController(
    length: orderList.length,
    vsync: this
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ReuseableText(title: "Orders", style: TextStyle(fontSize: 35.sp, fontWeight: FontWeight.bold, color: Tcolor.Text)),
      ),
      body: ListView(
        children: [
          OrderTabs(tabController: _tabController),
          SizedBox(
            height: 30.h,
          ),
          Container(
            height: height,
            color: Colors.transparent,
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  color: Colors.yellow,
                ),
                Container(
                  color: Colors.lightBlueAccent,
                ),
                Container(
                  color: Colors.indigo,
                ),
                Container(
                  color: Colors.teal,
                ),
                Container(
                  color: Colors.purpleAccent,
                ),
                Container(
                  color: Colors.redAccent,
                ),
              ] 
            ),
          )
        ],
      ),
    );
      
  }
}
