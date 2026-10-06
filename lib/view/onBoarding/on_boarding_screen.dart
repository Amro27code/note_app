import 'package:flutter/material.dart';
import 'package:note_app/controller/onb_controller.dart';
import 'package:note_app/core/constants/color_manager.dart';
import 'package:note_app/core/constants/font_family_manager.dart';
import 'package:note_app/core/constants/font_size_manager.dart';
import 'package:note_app/core/constants/height_manager.dart';
import 'package:note_app/core/constants/images_manager.dart';
import 'package:note_app/core/constants/size_manager.dart';
import 'package:note_app/core/constants/text_manager.dart';
import 'package:note_app/core/constants/width_manager.dart';
import 'package:note_app/core/functions/circle_button_widget.dart';
import 'package:note_app/core/functions/height_spacing.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  late OnbController _onbController;
  @override
  void initState() {
    super.initState();
    _onbController=OnbController(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: .infinity,
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Image.asset(
              ImagesManager.onbImage,
              width: WidthManager.w282,
              height: HeightManager.h231,
              alignment: .center,
            ),
            heightSpacing(55),
            Text(
              TextManager.titleOnb,
              textAlign: .center,
              style: TextStyle(
                fontFamily: FontFamilyManager.otamaEp,
                fontSize: FontSizeManager.fs48,
              ),
            ),
            heightSpacing(20),
            Text(
              TextManager.subtitleOnb,
              textAlign: .center,
              style: TextStyle(
                color: ColorManager.kGrey,
                fontSize: FontSizeManager.fs16,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: circleButtonWidget(
          onTap:_onbController.goToHomeScreen,
          icon: Icons.arrow_forward_ios,
          iconSize: SizeManager.s23,
        ),
      ),
    );
  }
}
