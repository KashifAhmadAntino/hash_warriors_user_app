import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:user_voting_app/core/constants/color_palette.dart';
import 'package:user_voting_app/core/reponsive/SizeConfig.dart';
import 'package:user_voting_app/core/routes/app_routes.dart';
import 'package:user_voting_app/core/utilites/utility.dart';
import 'package:user_voting_app/feature/auth/screen/home_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                SizeConfig.init(constraints, orientation);
                return GetMaterialApp(
                  navigatorKey: navigatorKey,
                  theme: ThemeData(
                    fontFamily: 'Mulish',
                    primarySwatch: createMaterialColor(Color(0xFF128807)),
                    // For changing color avatar background color in whole app
                    primaryColorDark: AppColors.kgrey,
                  ),
                  onGenerateRoute: GenerateRoute.generateRoute,
                  initialRoute: '/login',
                  title: 'Connectivity',
                  debugShowCheckedModeBanner: false,
                  // home: const ReferUnlockedContinetScreen(),
                );
              },
            );
          },
        );
      },
    );
  }
}
