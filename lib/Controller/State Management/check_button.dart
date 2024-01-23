import 'package:stock_management/linker.dart';

class CheckButton extends GetxController{
  bool button=true;

  isChecked(){
    button=!button;
    update();
  }
}