import 'package:flutter/material.dart';
import 'package:note_app/core/routes/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteManager.onRouteGenerate,
      initialRoute: RouteName.onbScreen,
      // routes: RouteManager.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
