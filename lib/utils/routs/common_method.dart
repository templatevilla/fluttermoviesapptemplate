import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../view/home screen/streaming_Model.dart';


class CommonMethod{

  static sendToNextScreen(BuildContext context,String routes, StreamingModel streamModel){
    Get.toNamed(routes,arguments: StreamingModel());
  }
}
class CommonPop{
  static popScreen(BuildContext context,String routes){
    Get.back();
  }
}
class CommonPushAndRemoveUntil{
  static pushRemoveUntil(BuildContext context,String routes){
    Navigator.pushNamedAndRemoveUntil(context, routes, (route) => false);
  }
}