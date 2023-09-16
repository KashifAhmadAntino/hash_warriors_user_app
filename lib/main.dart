import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:user_voting_app/core/constants/color_palette.dart';
import 'package:user_voting_app/core/reponsive/SizeConfig.dart';
import 'package:user_voting_app/core/routes/app_routes.dart';
import 'package:user_voting_app/core/utilites/utility.dart';
import 'package:user_voting_app/feature/auth/screen/home_screen.dart';
import 'package:auto_localization/auto_localization.dart';
import 'package:user_voting_app/firebase_options.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
                  navigatorObservers: [
                    FirebaseAnalyticsObserver(
                        analytics: FirebaseAnalytics.instance),
                  ],
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
