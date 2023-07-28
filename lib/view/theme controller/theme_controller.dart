

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/pref_data.dart';

class ThemeController extends GetxController{

  RxBool switchTheme = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setData();
  }

  setData() async {
    switchTheme.value =await PrefData.getDarkMode();
    update();
  }
  isDarkMode() async {
    return switchTheme.value;
  }
}