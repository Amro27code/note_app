import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/constants/color_manager.dart';
import 'package:note_app/core/constants/font_size_manager.dart';
import 'package:note_app/core/constants/size_manager.dart';
import 'package:note_app/core/constants/text_manager.dart';
import 'package:note_app/core/functions/circle_button_widget.dart';
import 'package:note_app/core/functions/height_spacing.dart';
import 'package:note_app/core/functions/width_spacing.dart';

import '../core/routes/route_manager.dart';
import '../view/new note/widget/custom_builder_modal_sheet.dart';
import '../view/new note/widget/custom_ok_or_delete_button_widget.dart';

class NewNoteController {
  final BuildContext context;
  late TextEditingController titleController;
  late TextEditingController subtitleController;
  GlobalKey<FormState> formNote = GlobalKey();

  NewNoteController(this.context) {
    initController();
  }

  void initController() async {
    titleController = TextEditingController();
    subtitleController = TextEditingController();
  }

  void disposeController() async {
    titleController.dispose();
    subtitleController.dispose();
  }

  void checkRequiredData() {
    if (titleController.text.trim().isEmpty ||
        subtitleController.text.trim().isEmpty) {
      String requiredData = TextManager.title;
      showAlertBottomSheet();
    } else {
      //! successfully
    }
  }

  void showAlertBottomSheet() async {
    FocusScope.of(context).unfocus();
    await showModalBottomSheet(
      context: context,
      isDismissible: false,
      backgroundColor: Colors.white,
      builder: (context) => CustomBuilderModalSheet(
        onPressedClose: () {
          Navigator.pop(context);
        },
        onPressedOK: onPressedOK,
        onPressedDelete: onPressedDelete,
      ),
    );
  }

  void onPressedOK() {}

  void onPressedDelete() {}

  void addNewNote() {}
}
