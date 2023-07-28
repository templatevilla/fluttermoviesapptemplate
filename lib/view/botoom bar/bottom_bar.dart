



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/view/setting_screen/setting_screen.dart';
import 'package:movie_app/view/theme/app_theme.dart';
import '../../utils/constant/app_color.dart';
import '../../utils/constant/app_image.dart';
import '../home screen/home_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  List<Widget> screenList = [
    const HomeScreen(),
    Container(height: 200,
       width: 200,
       color: Colors.red,
     ),
    Container(height: 200,
      width: 200,
      color: Colors.green,
    ),
    const SettingScreen(),
  ];
  void onItemTapped(int index) {
    setState(() {
      AppImages.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: screenList.elementAt(AppImages.currentIndex),
        ),
        bottomNavigationBar: bottomNavigationBars(),
      ),
    );
  }


  Widget bottomNavigationBars  (){
    return BottomNavigationBar(
      
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: AppColor.appColor,
      unselectedItemColor: const Color(0xFF707070),
      selectedIconTheme: IconThemeData(
        size: 25.h,
        color: AppColor.appBannerColor,
      ),
      
      unselectedIconTheme: IconThemeData(
        size: 25.h,
      ),
      type: BottomNavigationBarType.fixed,
      currentIndex: AppImages.currentIndex,
      selectedItemColor: Colors.black,
      onTap: onItemTapped,
      items:   <BottomNavigationBarItem>[
        BottomNavigationBarItem(

          activeIcon: Container(
            height: 32.h,
            width: 55.w,
            decoration: BoxDecoration(
              color: AppColor.appFont,
              borderRadius: BorderRadius.circular(20.h),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset(AppImages.bHome),
            ),
          ),
          icon: const ImageIcon(AssetImage(AppImages.bHome,)),
          label: '',
        ),
        BottomNavigationBarItem( backgroundColor: AppTheme.cardColors(context),

          activeIcon: Container(
            height: 32.h,
            width: 55.w,
            decoration: BoxDecoration(
              color:AppColor.appFont,
              borderRadius: BorderRadius.circular(20.h),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset(AppImages.bDiscovery,color: AppColor.appColor,),
            ),
          ),
          icon: const ImageIcon(AssetImage(AppImages.bDiscovery)),
          label: '',
        ),
        BottomNavigationBarItem(
          backgroundColor: AppTheme.cardColors(context),
          activeIcon: Container(
            height: 32.h,
            width: 55.w,
            decoration: BoxDecoration(
              color:AppColor.appFont,
              borderRadius: BorderRadius.circular(20.h),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset(AppImages.fev,color: AppColor.appColor,),
            ),
          ),
          icon: const ImageIcon(AssetImage(AppImages.fev)),
          label: '',
        ),
        BottomNavigationBarItem(
          backgroundColor: AppTheme.cardColors(context),
          activeIcon: Container(
            height: 32.h,
            width: 55.w,
            decoration: BoxDecoration(
              color:AppColor.appFont,
              borderRadius: BorderRadius.circular(20.h),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset(AppImages.bSetting,color: AppColor.appColor,),
            ),
          ),

          icon: const ImageIcon(AssetImage(AppImages.bSetting)),
          label: '',
        ),
      ],

    );
  }
}
