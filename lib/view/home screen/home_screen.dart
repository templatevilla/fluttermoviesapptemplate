import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/utils/common/app_space.dart';
import 'package:movie_app/utils/common/custom_text.dart';
import 'package:movie_app/utils/constant/app_color.dart';
import 'package:movie_app/utils/constant/app_image.dart';
import 'package:movie_app/utils/constant/app_string.dart';
import 'package:movie_app/view/home%20screen/app_movie_card.dart';
import 'package:movie_app/view/home%20screen/app_streaming_card.dart';
import 'package:movie_app/view/home%20screen/streaming_Model.dart';
import 'package:movie_app/view/theme/app_theme.dart';

import '../../data/app_data.dart';
import '../movie details/movie_details_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent,statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      backgroundColor:AppTheme.scaffoldBackgroundColor(context),
      body: homePage(),
    );
  }

  Widget homePage (){
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        AppSpace(
          height: 16.h,
        ),
        appBar(),
        AppSpace(
          height: 32.h,
        ),
        topMovieText(),
        AppSpace(
          height: 16.h,
        ),
        movieList(),
        AppSpace(
          height: 24.h,
        ),
        livePlayingText(),
        AppSpace(
          height: 16.h,
        ),
        streaming(),
        AppSpace(
          height: 24.h,
        ),
        moreGames(),
        SizedBox(
          height: 17.h,
        ),
        moreGamePoster(),
      ],
    );
  }

  Widget appBar(){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.h,vertical: 16.h),
      child: Row(
        children: [
          Expanded(
            child: CustomText(
              text: AppText.hello,
              fontWeight: FontWeight.normal,
              fontSize: 18.sp,
              textColor: AppTheme.getColorsTheme(context).textTheme.titleMedium!.color,
              textAlign: TextAlign.start,
            ),
          ),
          Image.asset(AppImages.bell,height: 24.h,width: 24.h,color: AppTheme.getColorsTheme(context).textTheme.titleMedium!.color,),
          SizedBox(
            width: 16.h,
          ),
          Image.asset(AppImages.profilePic,height: 40.h,width: 40.h,),

        ],
      ),
    );
  }
  Widget topMovieText (){
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.h),
      child: Row(
        children: [
          Expanded(
            child: CustomText(
              text: AppText.topMovie,
              textAlign: TextAlign.start,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              textColor: AppTheme.getColorsTheme(context).textTheme.titleMedium!.color,
            ),
          ),
          CustomText(
            text: AppText.viewAll,
            textAlign: TextAlign.start,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            textColor: AppColor.subColor,
          ),
        ],
      ),
    );
  }
  Widget movieList (){
    return SizedBox(
      height: 248.h,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal:16.h),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => AppMovieCard(
            movieName: AppData.movieName[index],
            moviePoster: AppData.moviePhoto[index],
          ),
          separatorBuilder: (context, index) => SizedBox(
            width: 16.h,
          ),
          itemCount:AppData.moviePhoto.length),
    );
  }
  Widget livePlayingText (){
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.h),
      child: Row(
        children: [
          Expanded(
            child: CustomText(
              text: AppText.playing,
              textAlign: TextAlign.start,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              textColor: AppTheme.getColorsTheme(context).textTheme.titleMedium!.color,
            ),
          ),
          CustomText(
            text: AppText.viewAll,
            textAlign: TextAlign.start,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            textColor: AppColor.subColor,
          ),
        ],
      ),
    );
  }
  Widget streaming (){
    return SizedBox(
      height: 211.h,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal:16.h),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>  GestureDetector(
            onTap: () {

              // CommonMethod.sendToNextScreen(context, RoutesPath.movieDetailsScreen,streamModel[index] );
              Get.to(MovieDetailsScreen(
                model: streamModel[index],
              ));
            },
            child: AppStreamingCard(
              image: streamModel[index].image,
              streamingName: streamModel[index].title,
              view: streamModel[index].view,
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(
            width: 8.h,
          ),
          itemCount: streamModel.length),
    );
  }
  Widget moreGames (){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomText(
        text: AppText.moreULike,
        fontSize:20.sp,
        fontWeight: FontWeight.w700,
        textAlign: TextAlign.start,
        textColor: AppTheme.getColorsTheme(context).textTheme.titleMedium!.color,
      ),
    );
  }
  Widget moreGamePoster () {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.h),
      child: Image.asset(AppImages.moreMovie),
    );
  }
}
