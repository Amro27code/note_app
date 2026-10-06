import 'package:flutter/material.dart';

import '../core/routes/route_manager.dart';

class OnbController {

  final BuildContext context;

  OnbController(this.context);

  void goToHomeScreen() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      RouteName.homeScreen,
          (route) => false,
    );
  }
}