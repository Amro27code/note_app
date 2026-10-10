import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/controller/home_controller.dart';
import 'package:note_app/core/constants/circular_radius_manager.dart';
import 'package:note_app/core/constants/color_manager.dart';
import 'package:note_app/core/functions/circle_button_widget.dart';
import 'package:note_app/core/functions/height_spacing.dart';
import '../../../core/constants/font_family_manager.dart';
import '../../../core/constants/font_size_manager.dart';
import '../../../core/constants/height_manager.dart';
import '../../../core/constants/size_manager.dart';
import '../../../core/constants/width_manager.dart';
import '../widget/custom_empty_note_screen_widget.dart';
import '../widget/custom_top_section_note_item.dart';

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
    _homeController = HomeController(context);
  }

  @override
  void dispose() {
    super.dispose();
    _homeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(scrolledUnderElevation: 0,
        title: Text(
          "Notes",
          style: TextStyle(
            fontFamily: FontFamilyManager.otamaEp,
            color: ColorManager.primary,
            fontSize: FontSizeManager.fs30,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: _homeController.notesOutput,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.data == null) {
            return Center(
              child: CupertinoActivityIndicator(
                color: ColorManager.primary,
                radius: SizeManager.s20,
              ),
            );
          } else if ((snapshot.data!).isEmpty) {
            return CustomBodyHomeOnEmpty();
          } else {
            return GridView.builder(
              itemCount: snapshot.data!.length,
              padding: EdgeInsets.all(25),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: HeightManager.h9,
                crossAxisSpacing: WidthManager.w11,
              ),
              itemBuilder: (context, index) => InkWell(
                borderRadius: BorderRadius.circular(CircularRadiusManager.c8),
                onTap: () {
                  _homeController.onTapNote(snapshot.data![index]);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 12,
                  ),
                  width: WidthManager.w157,
                  height: HeightManager.h125,
                  decoration: BoxDecoration(
                    color: _homeController.getColorRandomly(),

                    borderRadius: BorderRadius.circular(
                      CircularRadiusManager.c8,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      TopSectionNoteItem(
                        id: snapshot.data![index].id,
                        date: snapshot.data![index].date,
                        isDone: snapshot.data![index].isDone,
                      ),
                      Text(
                        snapshot.data![index].title,
                        maxLines: 1,
                        overflow: .ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: FontSizeManager.fs16,
                          fontFamily: FontFamilyManager.otamaEp,
                        ),
                      ),
                      heightSpacing(4),
                      Text(
                        snapshot.data![index].subtitle,
                        maxLines: 3,
                        overflow: .ellipsis,
                        style: TextStyle(
                          color: ColorManager.kGrey3,
                          fontSize: FontSizeManager.fs8,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: circleButtonWidget(
        onTap: _homeController.goToNewNoteScreen,
        icon: Icons.add,
        iconSize: SizeManager.s28,
      ),
    );
  }
}
