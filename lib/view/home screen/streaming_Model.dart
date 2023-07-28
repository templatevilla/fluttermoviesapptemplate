// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:movie_app/utils/constant/app_image.dart';
import 'package:movie_app/utils/constant/app_string.dart';

class StreamingModel {
  String? image;
  String? title;
  String? view;

  StreamingModel({
    this.image,
    this.title,
    this.view,
  });
}

List<StreamingModel> streamModel =[
  StreamingModel(
    image: AppImages.powerFullMen,
    title: AppText.thePowerFullMen,
    view:  AppText.viewers,
  ),
  StreamingModel(
    image: AppImages.redFall,
    title: AppText.redFall,
    view:  AppText.viewers,
  ),
  StreamingModel(
    image: AppImages.powerFullMen,
    title: AppText.thePowerFullMen,
    view:  AppText.viewers,
  ),
];