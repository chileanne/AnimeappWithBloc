import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTextStyle{

  static AppTextStyle instance = AppTextStyle();


  TextStyle bodyLarge =
  TextStyle(color: AppColor.appColor2, fontSize: 32, fontWeight: FontWeight.w900, );

  TextStyle bodyMedium =
  TextStyle(color: AppColor.appColor2, fontSize: 22, fontWeight: FontWeight.w600, );

  TextStyle bodySmall =
  TextStyle(color: AppColor.appColor2, fontSize: 10, fontWeight: FontWeight.w600,);

}