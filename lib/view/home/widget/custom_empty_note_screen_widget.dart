import 'package:flutter/material.dart';

import '../../../core/constants/font_family_manager.dart';
import '../../../core/constants/font_size_manager.dart';
import '../../../core/constants/height_manager.dart';
import '../../../core/constants/images_manager.dart';
import '../../../core/constants/text_manager.dart';
import '../../../core/constants/width_manager.dart';
import '../../../core/functions/height_spacing.dart';

class CustomBodyHomeOnEmpty extends StatelessWidget {
  const CustomBodyHomeOnEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: .infinity,
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Image.asset(
            ImagesManager.onbImage,
            width: WidthManager.w350,
            height: HeightManager.h286,
            alignment: .center,
          ),
          heightSpacing(6),
          Text(
            TextManager.emptyHome,
            textAlign: .center,
            style: TextStyle(
              fontFamily: FontFamilyManager.otamaEp,
              fontSize: FontSizeManager.fs20,
            ),
          ),
          heightSpacing(50),
        ],
      ),
    );
  }
}
