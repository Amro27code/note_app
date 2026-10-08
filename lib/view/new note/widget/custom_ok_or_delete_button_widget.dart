import 'package:flutter/material.dart';

import '../../../core/constants/color_manager.dart';
import '../../../core/constants/font_size_manager.dart';
import '../../../core/constants/size_manager.dart';

class CustomOkOrDeleteButton extends StatelessWidget {
  const CustomOkOrDeleteButton({
    super.key,
    required this.onPressed,
    required this.iconColor,
    required this.icon,
    required this.text,
  });

  final VoidCallback onPressed;
  final Color iconColor;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon, size: SizeManager.s32, color: iconColor),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: FontSizeManager.fs10,
            color: ColorManager.kSecondaryGrey2,
          ),
        ),
      ],
    );
  }
}
