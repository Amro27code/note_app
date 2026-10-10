import 'package:flutter/material.dart';
import 'package:note_app/view/No%20found%20screen/no_found_screen.dart';
import 'package:note_app/view/home/screens/home_screen.dart';
import 'package:note_app/view/new%20note/screen/new_note_screen.dart';
import 'package:note_app/view/onBoarding/on_boarding_screen.dart';
import 'package:note_app/view/splash/splash_screen.dart';

class RouteManager {
  static Route<dynamic>? onRouteGenerate(RouteSettings settings) {
    Widget body;

    switch (settings.name) {
      case RouteName.onbScreen:
        body = OnBoardingScreen();
      case RouteName.splashScreen:
        body = SplashScreen();

      case RouteName.homeScreen:
        body = HomeScreen();
      case RouteName.newNoteScreen:
        body = NewNoteScreen();
      default:
        body = NoFoundScreen();
    }
    return MaterialPageRoute(builder: (context) => body, settings: settings);
  }

  // static Map<String, WidgetBuilder> routes = {
  //   RouteName.splashScreen: (context) => const SplashScreen(),
  //   RouteName.onbScreen: (context) => const OnBoardingScreen(),
  // };
}

class RouteName {
  static const String splashScreen = "ssh";
  static const String onbScreen = "/";
  static const String homeScreen = "home";
  static const String newNoteScreen = "new note";
}
