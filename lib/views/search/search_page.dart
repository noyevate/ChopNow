import 'package:chopnow/common/color_extension.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: Tcolor.textField,
      ),
       body: Center(child: Text("Search", style: TextStyle(color: Tcolor.secondaryText, fontSize: 20),))
      
    );
  }
}