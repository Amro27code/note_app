import 'package:flutter/material.dart';

import '../constants/color_manager.dart';
import '../constants/size_manager.dart';

ElevatedButton circleButtonWidget({
  required VoidCallback onTap,
  required IconData icon,
  required double iconSize,
}) {
  return ElevatedButton(
    onPressed: onTap,
    style: ElevatedButton.styleFrom(
      shape: CircleBorder(),
      minimumSize: Size(75, 75),
      backgroundColor: ColorManager.primary,
    ),
    child: Icon(
      icon,
      color: Colors.white,
      size: iconSize,
    ),
  );
}
