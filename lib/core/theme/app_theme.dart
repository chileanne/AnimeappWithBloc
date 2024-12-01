
   import 'package:flutter/material.dart';

import 'app_styles.dart';

class AppTheme{
     static final _textStyle = AppTextStyle.instance;
     static ThemeData light = ThemeData(
       fontFamily: 'Inter',
       textTheme: TextTheme(
         bodyLarge: _textStyle.bodyLarge,
         bodyMedium: _textStyle.bodyMedium,
         bodySmall: _textStyle.bodySmall,
       ),
     );
   }