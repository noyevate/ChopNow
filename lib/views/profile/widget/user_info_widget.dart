import 'package:chopnow/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class UserInfoWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String email;
  final VoidCallback? onEditPressed;
  final Color? color;

  const UserInfoWidget({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.email,
    this.onEditPressed, this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      color: Tcolor.white,
      child: Row(
        children: [
          
          // Display user image in a circle
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 50.r,
          ),
          SizedBox(width: 20.w), // Add some spacing
          // Display user name and email vertically
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 30.h,
                  fontWeight: FontWeight.normal,
                  color: Tcolor.Text
                ),
              ),
              SizedBox(width: 20.h),
              Text(
                email,
                style: TextStyle(fontSize: 30.h,
                  fontWeight: FontWeight.normal,
                  color: Tcolor.Text),
              ),
            ],
          ),
          Expanded(child: Container()), // Add spacer to push the edit icon to the end
          // Display edit icon
          GestureDetector(
            onTap: onEditPressed,
            child: Icon(AntDesign.edit, color: Tcolor.gray,),
          ),
        ],
      ),
    );
  }
}
