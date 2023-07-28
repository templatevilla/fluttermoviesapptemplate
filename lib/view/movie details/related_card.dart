import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constant/app_color.dart';
import '../../utils/constant/app_image.dart';

class RelatedCard extends StatelessWidget {
  final String? image;
  const RelatedCard({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 158.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.subColor,
        ),
        borderRadius: BorderRadius.circular(17.r),
      ),
      child: Image.asset(image??AppImages.releted1),

    );
  }
}
