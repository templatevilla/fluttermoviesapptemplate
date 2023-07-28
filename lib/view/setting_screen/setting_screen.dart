import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:movie_app/utils/common/custom_text.dart';

import '../../data/pref_data.dart';
import '../../main.dart';
import '../theme controller/theme_controller.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppTheme.scaffoldBackgroundColor(context),
      body: Center(
        child:   GetBuilder<ThemeController>(builder: (controller) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                text: 'Dark Mode ',
              ),
              SizedBox(
                width: 50.h,
              ),
              CupertinoSwitch(
                activeColor: Colors.cyan,
                value:controller.switchTheme.value,
                onChanged: (value) async {
                  controller.switchTheme.value=value;
                  themeController.update();
                  PrefData.setDarkMode( controller.switchTheme.value);
                },),
            ],
          );
        },init: ThemeController(),),
      ),
    );
  }
}
