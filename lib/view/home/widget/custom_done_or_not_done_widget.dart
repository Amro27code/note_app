import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/circular_radius_manager.dart';
import '../../../core/constants/color_manager.dart';
import '../../../core/constants/font_family_manager.dart';
import '../../../core/constants/font_size_manager.dart';
import '../../../core/constants/size_manager.dart';

class CustomDoneOrNotDoneNote extends StatelessWidget {
  const CustomDoneOrNotDoneNote({super.key, required this.isDone});

  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isDone
            ? ColorManager.primaryBase2
            : ColorManager.kRedSecondaryBase,
        borderRadius: BorderRadius.circular(CircularRadiusManager.c5),
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        spacing: 5,
        children: [
          Text(
            isDone ? "done" : "not done",
            style: TextStyle(
              color: isDone ? Colors.white : ColorManager.kRedPrimaryBase,
              fontSize: FontSizeManager.fs12,
              fontFamily: FontFamilyManager.otamaEp,
            ),
          ),
          CircleAvatar(
            backgroundColor: isDone
                ? ColorManager.primaryBase1
                : ColorManager.kRedPrimaryBase,
            radius: 9,
            child: Icon(
              isDone ? CupertinoIcons.checkmark : Icons.close_sharp,
              color: isDone ? Colors.black : Colors.white,
              size: SizeManager.s12,
            ),
          ),
        ],
      ),
    );
  }
}
