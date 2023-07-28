import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/view/theme/app_theme.dart';
import '../../utils/common/custom_text.dart';
import '../../utils/constant/app_color.dart';
import '../../utils/constant/app_image.dart';
import '../../utils/constant/app_string.dart';

class AppStreamingCard extends StatelessWidget {
  final String? image;
  final String? streamingName;
  final String? view;

  const AppStreamingCard({super.key,  this.image,  this.streamingName, this.view});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 210.h,
      decoration: BoxDecoration(
        color: AppTheme.cardColors(context),
        border: Border.all(
          color: AppColor.subColor,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          streamingImage(),
      Padding(
        padding:  EdgeInsets.only(top: 8,bottom: 8,left: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: streamingName??AppText.thePowerFullMen,
              fontWeight: FontWeight.w500,
              fontSize: 20.h,
              textColor:AppTheme.getColorsTheme(context).textTheme.titleMedium!.color,
              textAlign: TextAlign.start,
            ),
            CustomText(
              text: view??AppText.viewers,
              fontWeight: FontWeight.w400,
              fontSize: 16.h,
              textColor: AppColor.subColor,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
        ],
      ),
    );
  }
  Widget streamingImage(){
    return Expanded(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(image??AppImages.powerFullMen,height: 144.h,),
          Positioned(
            top: 4.h,
            left: 171.h,
            child: Container(
              height: 23.h,

              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color:  const Color(0x33FFFFFF),
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.h,vertical: 4.h),
                child: Row(
                  children: [
                    Image.asset(AppImages.dot,height: 4.h,),
                    SizedBox(
                      width: 4.h,
                    ),
                    CustomText(
                      text: AppText.streaming,
                      textAlign: TextAlign.center,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      textColor: AppColor.appFont,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
