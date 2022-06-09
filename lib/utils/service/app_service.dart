import 'package:get/get.dart';

class AppService extends GetxService {
  static AppService get to => Get.find();
  final isLoggedIn = false.obs;
  var userInfo = [].obs;

  bool get isLoggedInValue => isLoggedIn.value;

  @override
  void onInit() async {
    await init();
    super.onInit();
  }

  Future<void> init() async {

  }


}
