import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/utils/routs/routs_page.dart';
import 'package:movie_app/view/botoom%20bar/bottom_bar.dart';
import 'package:movie_app/view/theme%20controller/theme_controller.dart';
import 'package:movie_app/view/theme/app_theme.dart';


final ThemeController themeController = Get.put (ThemeController());

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:  const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return  GetBuilder(builder: (controller) {
            return GetMaterialApp(

              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: 'CircularStd',
              ),
              title: 'Movie App',
              darkTheme: !controller.switchTheme.value?AppTheme.lightThem:AppTheme.darkThem,
              themeMode: controller.switchTheme.value?ThemeMode.dark:ThemeMode.light,

              home: child,
              initialRoute:  '/',
              routes: AppRouts.routs,
            );
          },init: ThemeController(),);
        },
        child: const BottomBar(),
    );
  }
}