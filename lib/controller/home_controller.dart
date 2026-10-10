import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:note_app/core/constants/color_manager.dart';
import 'package:note_app/core/constants/text_manager.dart';
import 'package:note_app/core/database/hive_helper.dart';
import 'package:note_app/model/note_model.dart';

import '../core/routes/route_manager.dart';

class HomeController {
  final BuildContext context;
  List<NoteModel> myNotes = [];
  late StreamController<List<NoteModel>> _notesStreamController;
  late Stream<List<NoteModel>> notesOutput;
  late Sink<List<NoteModel>> _notesInput;
  List<Color> randomColor = [
    ColorManager.primary,
    ColorManager.kRand2,
    ColorManager.kRand3,
    ColorManager.kRand4,
    ColorManager.kRand5,
  ];

  HomeController(this.context) {
    init();
  }

  void init() async {
    _notesStreamController = StreamController();
    _notesInput = _notesStreamController.sink;
    notesOutput = _notesStreamController.stream;
    // _notesInput.add([]);
    await getAllNotes();
  }


  Future<void> getAllNotes() async {
    HiveHelper helper = HiveHelper(TextManager.boxName1);
    myNotes = await helper.getAllData();
    _notesInput.add(myNotes);
  }

  Color getColorRandomly() {
    int n = Random().nextInt(randomColor.length);
    return randomColor[n];
  }

  void goToNewNoteScreen() {
    Navigator.pushNamed(
      context,
      RouteName.newNoteScreen,
    ).then((value) async => await getAllNotes());
  }

  void dispose() {
    _notesStreamController.close();
    _notesInput.close();
  }

  void onTapNote(NoteModel noteModel) {
    print("Tapped=> $noteModel");
    Navigator.pushNamed(
      context,
      RouteName.newNoteScreen,
      arguments: noteModel,
    ).then((value) async => await getAllNotes());
  }
}
