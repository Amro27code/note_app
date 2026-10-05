import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_app/core/constants/color_manager.dart';
import 'package:note_app/core/constants/images_manager.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red),
      body: SizedBox(width:.infinity,
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Image.asset(
              ImagesManager.onbImage,
              width: 282,
              height: 231,
              alignment: .center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            minimumSize: Size(75, 75),
            backgroundColor: ColorManager.primary,
          ),
          child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 23),
        ),
      ),
    );
  }
}
