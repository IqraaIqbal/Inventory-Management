import 'package:stock_management/linker.dart';

class Loading extends GetxController{
  bool loading=false;

  isClickedTrue(){
    loading=true;
    update();
  }
  isClickedFalse(){
    loading=false;
    update();
  }
}