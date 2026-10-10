import 'package:flutter/material.dart';
import 'package:note_app/core/constants/font_family_manager.dart';
import 'package:note_app/core/routes/route_manager.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360.0, 800.0),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.white),
          scaffoldBackgroundColor: Colors.white,
          fontFamily: FontFamilyManager.roboto,
        ),
        onGenerateRoute: RouteManager.onRouteGenerate,
        initialRoute: RouteName.onbScreen,
        // routes: RouteManager.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
