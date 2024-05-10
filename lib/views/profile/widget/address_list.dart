import 'package:chopnow/common/color_extension.dart';
import 'package:chopnow/models/address_response.dart';
import 'package:chopnow/views/profile/widget/address_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressListWidget extends StatelessWidget {
  const AddressListWidget({super.key, required this.addresses});

  final List<AddressResponseModel> addresses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: addresses.length,
      itemBuilder: (context, index) {
        final address = addresses[index];
        return Container(
          decoration: BoxDecoration(
            color: Tcolor.white,
            border: Border(
              bottom: BorderSide(
                color: Tcolor.gray,
                width: 1.w,
              ),
              top: BorderSide(
                color: Tcolor.gray,
                width: 1.w,
              ),
            )
          ),
          child: AddressTile(address: address),
        );
      },
    );
  }
}