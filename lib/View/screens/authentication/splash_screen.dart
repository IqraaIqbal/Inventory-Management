// ignore_for_file: unused_import

import 'dart:async';

import 'package:stock_management/Controller/State%20Management/splashController.dart';
import 'package:stock_management/linker.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child:  Center(
          child: SizedBox(
              height: 250,
              width: 250,
              child: Image.asset("assets/images/splash.png")),
        ),
      ),
    );
  }
}
