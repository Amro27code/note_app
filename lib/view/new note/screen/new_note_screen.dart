import 'package:flutter/material.dart';
import 'package:note_app/core/constants/color_manager.dart';
import 'package:note_app/core/constants/font_size_manager.dart';
import 'package:note_app/core/constants/text_manager.dart';
import 'package:note_app/core/functions/height_spacing.dart';
import '../../../controller/new_note_controller.dart';
import '../widget/app_bar_widget.dart';

class NewNoteScreen extends StatefulWidget {
  const NewNoteScreen({super.key});

  @override
  State<NewNoteScreen> createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  late NewNoteController _newNoteController;
bool _isDataLoaded=false;
  @override
  void initState() {
    super.initState();
    _newNoteController = NewNoteController(context);
  }
@override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isDataLoaded) {
      _newNoteController.getDataFromLastScreen();
      _isDataLoaded=true;
    }
  }
  @override
  void dispose() {
    super.dispose();
    _newNoteController.disposeController();
  }

  @override
  Widget build(BuildContext context) {
    // _newNoteController.getDataFromLastScreen();
    return Scaffold(
      appBar: AppBarNewNoteWidget(
        onPressedSave: _newNoteController.checkRequiredData,
        isEdit:_newNoteController.isEdit
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _newNoteController.formNote,
            child: Column(
              children: [
                TextFieldWidget(
                  controller: _newNoteController.titleController,
                  isTitle: true,
                ),
                heightSpacing(20),
                Expanded(
                  child: TextFieldWidget(
                    controller: _newNoteController.subtitleController,
                    isTitle: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this._controller,
    required this.isTitle,
  });

  // final int? maxLines;
  final TextEditingController _controller;
  final bool isTitle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      maxLines: isTitle ? 1 : null,
      expands: !isTitle,
      cursorColor: Colors.black,
      style: TextStyle(
        color: Colors.black,
        decoration: TextDecoration.none,
        fontSize: isTitle ? FontSizeManager.fs48 : FontSizeManager.fs23,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hint: Text(
          isTitle ? TextManager.title : TextManager.subtitleTextField,
          style: TextStyle(
            color: ColorManager.kHintColor,
            fontSize: isTitle ? FontSizeManager.fs48 : FontSizeManager.fs23,
          ),
        ),
      ),
    );
  }
}
