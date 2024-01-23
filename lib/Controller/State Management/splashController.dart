import 'dart:async';
import 'package:stock_management/linker.dart';

class SplashController extends GetxController{
@override
  void onInit() {

  Timer(const Duration(seconds: 3), () {
    if(FirebaseAuth.instance.currentUser == null){
      Get.to(const AccountScreen());
    }
    else{
    //  Get.to(Testing());
    Get.to(HomeScreen());

    }
  });
    super.onInit();
  }
}