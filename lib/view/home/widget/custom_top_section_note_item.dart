import 'package:flutter/material.dart';

import '../../../core/constants/font_size_manager.dart';
import '../../../core/constants/images_manager.dart';
import '../../../core/functions/height_spacing.dart';
import 'custom_done_or_not_done_widget.dart';

class TopSectionNoteItem extends StatelessWidget {
  const TopSectionNoteItem({
    super.key,
    required this.id,
    required this.date,
    required this.isDone,
  });

  final int id;
  final String date;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      crossAxisAlignment: .start,
      children: [
        Stack(
          alignment: .center,
          children: [
            Image.asset(ImagesManager.girdId),
            Text(
              "$id",
              style: TextStyle(
                color: Colors.white,
                fontWeight: .w700,
                fontSize: FontSizeManager.fs12,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            CustomDoneOrNotDoneNote(isDone: isDone),
            heightSpacing(7),
            Text(
              date,
              style: TextStyle(
                fontSize: FontSizeManager.fs8,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
