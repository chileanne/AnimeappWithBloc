

import 'package:flutter/material.dart';

import '../../../core/theme/app_color.dart';

class BackwardForwardBtns extends StatelessWidget {
  final IconData icon;
  final  Function() ontap;
  const BackwardForwardBtns({super.key, required this.icon, required this.ontap, });

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: ontap,
      child: Container(
        width: 48.0,
        height: 46.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.appColor4
        ),
        child: Center(child: Icon(icon,color: AppColor.appColor2,size: 30,)),
      ),
    );
  }
}
