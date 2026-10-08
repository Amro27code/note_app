import 'package:flutter/material.dart';

import '../constants/color_manager.dart';

ElevatedButton circleButtonWidget({
  required VoidCallback onTap,
  required IconData icon,
  double circleSize = 75,
  Color backgroundColor = ColorManager.primary,
  Color iconColor = Colors.white,
  bool isCircleShape = true,
  required double iconSize,
}) {
  return ElevatedButton(
    onPressed: onTap,
    style: ElevatedButton.styleFrom(
      shape: isCircleShape
          ? CircleBorder()
          : RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
      minimumSize: isCircleShape ? Size(circleSize, circleSize) : Size(33, 83),
      backgroundColor: backgroundColor,
    ),
    child: Icon(icon, color: iconColor, size: iconSize),
  );
}
