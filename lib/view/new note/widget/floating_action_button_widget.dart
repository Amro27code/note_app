import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/color_manager.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key, required this.onPressedSave, required this.isEdit});
final VoidCallback onPressedSave;
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.0, top: 5.0),
      child: FloatingActionButton(
        elevation: 0,
        onPressed: onPressedSave,
        backgroundColor: ColorManager.primary,
        foregroundColor: Colors.white,
        child: Icon(isEdit?CupertinoIcons.pencil:CupertinoIcons.checkmark_alt_circle),
      ),
    );
  }
}
