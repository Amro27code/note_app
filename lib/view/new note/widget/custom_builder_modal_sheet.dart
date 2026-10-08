import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/color_manager.dart';
import '../../../core/constants/font_size_manager.dart';
import '../../../core/constants/text_manager.dart';
import '../../../core/functions/circle_button_widget.dart';
import '../../../core/functions/height_spacing.dart';
import '../../../core/functions/width_spacing.dart';
import 'custom_ok_or_delete_button_widget.dart';

class CustomBuilderModalSheet extends StatelessWidget {
  const CustomBuilderModalSheet({
    super.key,
    required this.onPressedClose,
    required this.onPressedOK,
    required this.onPressedDelete,
  });

  final VoidCallback onPressedClose;
  final VoidCallback onPressedOK;
  final VoidCallback onPressedDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: .infinity,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisSize: .min,
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          Row(
            mainAxisAlignment: .end,
            crossAxisAlignment: .end,
            children: [
              Column(
                children: [
                  Text(
                    TextManager.errorTextBottomSheet,
                    style: TextStyle(
                      fontSize: FontSizeManager.fs16,
                      fontWeight: .w700,
                    ),
                  ),
                  Text(
                    TextManager.toSave,
                    style: TextStyle(
                      fontSize: FontSizeManager.fs10,
                      color: ColorManager.kSecondaryGrey2,
                    ),
                  ),
                ],
              ),
              widthSpacing(27),
              circleButtonWidget(
                onTap: onPressedClose,
                icon: Icons.close,
                iconSize: 21,
                circleSize: 34,
                backgroundColor: ColorManager.kGrey2,
                iconColor: ColorManager.kSecondaryGrey2,
              ),
            ],
          ),
          heightSpacing(16),
          Divider(height: 0),
          heightSpacing(16),
          Row(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              CustomOkOrDeleteButton(
                onPressed: onPressedOK,
                iconColor: ColorManager.kPrimaryBase,
                icon: CupertinoIcons.checkmark_circle,
                text: TextManager.ok,
              ),
              widthSpacing(36),
              CustomOkOrDeleteButton(
                onPressed: onPressedDelete,
                iconColor: Colors.red,
                icon: CupertinoIcons.delete,
                text: TextManager.delete,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
