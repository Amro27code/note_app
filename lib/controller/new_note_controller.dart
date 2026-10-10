import 'package:flutter/material.dart';
import 'package:note_app/core/database/hive_helper.dart';
import 'package:note_app/model/note_model.dart';
import '../core/constants/text_manager.dart';
import '../core/functions/custom_builder_modal_sheet.dart';

class NewNoteController {
  final BuildContext context;
  late TextEditingController titleController;
  late TextEditingController subtitleController;
  bool isEdit = false;
  GlobalKey<FormState> formNote = GlobalKey();

  NewNoteController(this.context) {
    initController();
  }

  NoteModel? myNoteModel;

  void initController() async {
    titleController = TextEditingController();
    subtitleController = TextEditingController();
  }

  void disposeController() async {
    titleController.dispose();
    subtitleController.dispose();
  }

  Future<void> checkRequiredData() async {
    print("titleController.text=> ${titleController.text}");
    print("subtitleController.text=> ${subtitleController.text}");
    if (titleController.text.trim().isEmpty ||
        subtitleController.text.trim().isEmpty) {
      print("titleController.text=> ${titleController.text}");
      print("subtitleController.text=> ${subtitleController.text}");

      showAlertBottomSheet();
    } else {
      //! successfully
      await addNewNote(true);
    }
  }

  void showAlertBottomSheet() async {
    FocusScope.of(context).unfocus();
    print("titleController.text=> ${titleController.text}");
    print("subtitleController.text=> ${subtitleController.text}");

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

  Future<void> onPressedOK() async {
    await addNewNote(false);
    Navigator.pop(context);
  }

  void onPressedDelete() {
    Navigator.pop(context);
    Navigator.pop(context);
  }

  void getDataFromLastScreen() {
    final arguments = ModalRoute.of(context)?.settings.arguments;

    if (arguments is NoteModel) {
      myNoteModel = arguments;

      isEdit = true;
      //
      // print(myNoteModel!.title);
      // print(myNoteModel!.subtitle);

      titleController.text = myNoteModel!.title;
      subtitleController.text = myNoteModel!.subtitle;
    }
  }

  Future<void> addNewNote(bool isDone) async {
    DateTime dateTime = DateTime.now();
    String myDate = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    int id;
    if (myNoteModel == null) {
      id = await getIdToNote();
      id++;
    } else {
      id = myNoteModel!.id;
    }
    print("id=> $id");
    NoteModel noteModel = NoteModel(
      id: id,
      title: titleController.text.trim(),
      subtitle: subtitleController.text.trim(),
      date: myDate,
      isDone: isDone,
    );
    print(noteModel);
    HiveHelper<Map<String, dynamic>> hiveHelper =
        HiveHelper<Map<String, dynamic>>(TextManager.boxName1);
    await hiveHelper.addValue(
      value: noteModel.toJson(),
      key: noteModel.id.toString(),
    );
    if (myNoteModel == null) await changeId(id);
    Navigator.pop(context);
  }

  Future<void> changeId(int id) async {
    print("Last ID is => $id");
    HiveHelper<int> hiveHelper = HiveHelper<int>(TextManager.idBox);
    HiveHelper<Map<String, dynamic>> helper = HiveHelper<Map<String, dynamic>>(
      TextManager.boxName1,
    );
    await hiveHelper.addValue(value: id, key: TextManager.idKey);
    print("done");
    print(await helper.getItem(key: id.toString()));
  }

  Future<int> getIdToNote() async {
    HiveHelper<int> hiveHelper = HiveHelper<int>(TextManager.idBox);
    return await hiveHelper.getItem(key: TextManager.idKey) ?? 0;
  }
}
