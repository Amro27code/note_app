import 'package:flutter/material.dart';
import 'package:note_app/controller/home_controller.dart';
import 'package:note_app/core/constants/color_manager.dart';
import 'package:note_app/core/functions/circle_button_widget.dart';
import '../../../core/constants/font_family_manager.dart';
import '../../../core/constants/font_size_manager.dart';
import '../../../core/constants/height_manager.dart';
import '../../../core/constants/images_manager.dart';
import '../../../core/constants/size_manager.dart';
import '../../../core/constants/text_manager.dart';
import '../../../core/constants/width_manager.dart';
import '../../../core/functions/height_spacing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController _homeController;
  @override
  void initState() {
    super.initState();
    _homeController=HomeController(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notes",
          style: TextStyle(
            fontFamily: FontFamilyManager.otamaEp,
            color: ColorManager.primary,
            fontSize: FontSizeManager.fs30,
          ),
        ),
      ),
      body: SizedBox(
        width: .infinity,
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Image.asset(
              ImagesManager.onbImage,
              width: WidthManager.w350,
              height: HeightManager.h286,
              alignment: .center,
            ),
            heightSpacing(6),
            Text(
              TextManager.emptyHome,
              textAlign: .center,
              style: TextStyle(
                fontFamily: FontFamilyManager.otamaEp,
                fontSize: FontSizeManager.fs20,
              ),
            ),
            heightSpacing(50),
          ],
        ),
      ),
      floatingActionButton: circleButtonWidget(
        onTap: _homeController.goToNewNoteScreen,
        icon: Icons.add,
        iconSize: SizeManager.s28,
      ),
    );
  }
}
