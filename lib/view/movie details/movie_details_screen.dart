import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_app/utils/common/app_space.dart';
import 'package:movie_app/utils/common/custom_text.dart';
import 'package:movie_app/utils/constant/app_color.dart';
import 'package:movie_app/utils/constant/app_image.dart';
import 'package:movie_app/utils/constant/app_string.dart';
import 'package:movie_app/view/movie%20details/related_card.dart';

import 'package:movie_app/view/theme/app_theme.dart';
import '../home screen/streaming_Model.dart';
import 'movie_controller.dart';

// ignore: must_be_immutable
class MovieDetailsScreen extends StatefulWidget {
   StreamingModel? model;
   MovieDetailsScreen({super.key, this.model});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
   final MovieController movieController = Get.put(MovieController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          AppSpace(
            height: 16.h,
          ),
          appBar(),
          AppSpace(
            height: 24.h,
          ),
          streamingPoster(),
          AppSpace(
            height: 16.h,
          ),
          streamingTitle(),
          AppSpace(
            height: 4.h,
          ),
          rating(),
          AppSpace(
            height: 16.h,
          ),
          aboutText(),
          AppSpace(
            height: 8.h,
          ),
          streamDescription(),
          AppSpace(
            height: 16.h,
          ),
          divider(),
          AppSpace(
            height: 16.h,
          ),
          reletedText(),
          AppSpace(
            height: 16.h,
          ),
          reletedMovie(),
          AppSpace(
            height: 30.h,
          ),
        ],
      ),
    );
  }

  List<String> relatedMovie =[
     AppImages.releted1,
     AppImages.releted2,
     AppImages.releted1,
   ];
  Widget appBar (){
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap :() {
                Get.back();
              },
              child: Icon(Icons.arrow_back_ios_new_rounded,
                size: 24.h,color: AppTheme.getColorsTheme(context).textTheme.titleMedium!.color,)),
          GetBuilder(builder: (controller) {
            return GestureDetector(
                onTap: () {

                  controller.isPressed.value = !controller.isPressed.value;
                  movieController.update();
                },
                child: controller.isPressed.value?Icon(
                  Icons.favorite_sharp,
                  color: Colors.red,
                  size: 24.h,
                ):Image.asset(AppImages.fev,
                  height: 24.h,color: AppTheme.getColorsTheme(context).textTheme.titleMedium!.color,));

          },init: MovieController(),)
        ],
      ),
    );
  }
  Widget streamingPoster (){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.h),
      child: Image.asset(AppImages.powerFullMenBanner,),
    );
  }
  Widget streamingTitle (){
    debugPrint('data==== ${widget.model!.title}');
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.h),
      child: Row(
        children: [
          Expanded(
            child: CustomText(
              text:widget.model!.title,
              textColor: AppTheme.getColorsTheme(context).textTheme.titleMedium!.color,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w700,
              fontSize: 24.sp,
            ),
          ),
          Container(
            height: 23.h,
            decoration: BoxDecoration(
              color: const Color(0x1A000001),
              borderRadius: BorderRadius.circular(16.h),
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.h,vertical: 4.h),
              child: CustomText(
                text: AppText.indiaGame,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                textColor: AppTheme.getColorsTheme(context).textTheme.titleMedium!.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget rating (){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        children: [
          Image.asset(AppImages.star,height: 15.h,),
          SizedBox(
            width: 4.h,
          ),
          CustomText(
            text: '4.6',
            fontWeight: FontWeight.w400,
            textColor: Colors.grey,
            fontSize: 16.h,
          )
        ],
      ),

    );
  }
  Widget aboutText (){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomText(
        text: AppText.about,
        fontSize: 18.sp,
        textColor:AppTheme.getColorsTheme(context).textTheme.titleMedium!.color,
        fontWeight: FontWeight.w700,
        textAlign: TextAlign.start,
      ),
    );
  }
  Widget streamDescription (){
    return Padding(
      padding:  EdgeInsets.only(left: 16.h,right: 19.h),
      child: CustomText(
        text: AppText.detilsDiscription,
        textColor: AppColor.subColor,
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        textAlign: TextAlign.start,
      ),
    );
  }
  Widget divider (){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.h),
      child: Divider(
        color: const Color(0xFFF5F5F5),
        thickness: 2.h,
      ),
    );
  }
  Widget reletedText(){
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomText(
        text: AppText.releted ,
        textColor: AppTheme.getColorsTheme(context).textTheme.titleMedium!.color,
        fontWeight: FontWeight.w700,
        fontSize: 18.sp,
        textAlign: TextAlign.start,
      ),
    );
  }
  Widget reletedMovie(){
    return SizedBox(
      height: 158.h,
      child: ListView.separated(
        physics:  const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => RelatedCard(
            image: relatedMovie[index],
          ),
          separatorBuilder: (context, index) => SizedBox(
            width: 16.h,
          ),
          itemCount:relatedMovie.length ),
    );
  }
}
