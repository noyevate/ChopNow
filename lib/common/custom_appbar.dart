import 'package:chopnow/common/color_extension.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String leftAvatarImageUrl;
  //final String rightAvatarImageUrl;
  final String deliverToText;
  final String childText;

  const CustomAppBar({
    Key? key,
    required this.leftAvatarImageUrl,
    //required this.rightAvatarImageUrl,
    required this.deliverToText,
    required this.childText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: CircleAvatar(
        backgroundColor: Tcolor.primary,
        backgroundImage: NetworkImage(leftAvatarImageUrl),
      ),
      actions:  [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(getTimeOfDay(), style: const TextStyle(fontSize: 35),)
          
        ),
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            deliverToText,
            style:  TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Tcolor.primary),
          ),
          const SizedBox(height: 2,),
          Text(
            childText,
            style:  TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Tcolor.Text),
          ),
        ],
      ),
    );
    
  }

  @override
  Size get preferredSize => const Size.fromHeight(70); // Increase the size of the app bar

  String getTimeOfDay() {
    final now = DateTime.now();
    final hour = now.hour;
    if(hour >= 17 && hour < 7){
      return '🌙';
    } else if(hour >= 16 && hour < 18){
      return '⛅';
    } else {
      return '☀️';
    }
  }
}


