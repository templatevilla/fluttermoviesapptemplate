import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/view/theme/app_theme.dart';
import '../../utils/common/custom_text.dart';
import '../../utils/constant/app_color.dart';
import '../../utils/constant/app_image.dart';
import '../../utils/constant/app_string.dart';

class AppMovieCard extends StatelessWidget {
  final String? moviePoster;
  final String? movieName;

  const AppMovieCard({super.key, this.moviePoster, this.movieName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 248.h,
      decoration: BoxDecoration(
        color: AppTheme.cardColors(context),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColor.subColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          poster(),
          Padding(
            padding:  EdgeInsets.only(left: 16.h,top: 8.h,bottom: 8.h),
            child: CustomText(
              textColor: AppTheme.getColorsTheme(context).textTheme.titleMedium!.color,
              fontWeight: FontWeight.w500,
              fontSize: 20.h,
              textAlign: TextAlign.start,
              text:movieName?? AppText.theBoy,
            ),
          ),
        ],
      ),
    );
  }
  Widget poster (){
    return Image.asset(moviePoster??AppImages.movie1,height: 205.h,);
  }

}
