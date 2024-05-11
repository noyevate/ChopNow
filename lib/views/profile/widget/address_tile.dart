import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/common_widget/reusable_text.dart';
import 'package:chopnow/models/address_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({super.key, required this.address});

  final AddressResponseModel address;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {

      },
      visualDensity: VisualDensity.compact,
      leading: Icon(
        SimpleLineIcons.location_pin,
        color: Tcolor.primary,
        size: 56.h,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      title: ReuseableText(
        title: address.addressLine1,
        style: TextStyle(
            fontSize: 25.sp, color: Tcolor.gray, fontWeight: FontWeight.w500),
            
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReuseableText(
            title: address.postalCode,
            style: TextStyle(
                fontSize: 25.sp, color: Tcolor.gray, fontWeight: FontWeight.w500),
                
          ),
          ReuseableText(
            title: "tap to set as default",
            style: TextStyle(
                fontSize: 15.sp, color: Tcolor.Secondary, fontWeight: FontWeight.w500),
                
          ),
          
        ],
      ),
    );
  }
}
