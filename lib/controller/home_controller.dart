import 'package:flutter/material.dart';

import '../core/routes/route_manager.dart';

class HomeController {
  final BuildContext context;

  HomeController(this.context);

  void goToNewNoteScreen() {
    Navigator.pushNamed(
      context,
      RouteName.newNoteScreen,
    );
  }
}