import 'package:chopnow/common/color_extension.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Tcolor.textField,
      ),
       body: Center(child: Text("Cart", style: TextStyle(color: Tcolor.secondaryText, fontSize: 20),))
    );
  }
}