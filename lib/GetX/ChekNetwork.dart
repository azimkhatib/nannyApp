import 'package:get/get.dart';

import 'Network_controller.dart';

class CheckNetwork {

  static void init() {
    Get.put<NetworkController>(NetworkController(),permanent:true);
  }
}