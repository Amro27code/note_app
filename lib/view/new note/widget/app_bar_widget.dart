import 'package:flutter/material.dart';

import '../../../core/constants/color_manager.dart';
import '../../../core/constants/font_family_manager.dart';
import '../../../core/constants/font_size_manager.dart';
import 'floating_action_button_widget.dart';

class AppBarNewNoteWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarNewNoteWidget({super.key, required this.onPressedSave, required this.isEdit});
final VoidCallback onPressedSave;
final bool isEdit;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: ColorManager.primary,
      title: Text(
        "Back",
        style: TextStyle(
          fontFamily: FontFamilyManager.otamaEp,
          fontSize: FontSizeManager.fs20,
        ),
      ),
      actions: [
        FloatingActionButtonWidget(onPressedSave:onPressedSave, isEdit: isEdit ,),
        // circleButtonWidget(
        //   onTap: () {},
        //   icon: CupertinoIcons.checkmark_alt_circle,
        //   iconSize: SizeManager.s20,
        //   isCircleShape: false
        // ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
