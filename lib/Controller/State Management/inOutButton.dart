import 'package:stock_management/linker.dart';


class InOutButton extends GetxController{
  int button=1;
  String type='In';

  changeButton(){
    if(button==1){
      button=2;
      type='Out';
    }
    else{
      button=1;
      type='In';
    }
    update();
  }
}