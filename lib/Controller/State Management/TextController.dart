import 'package:stock_management/linker.dart';

class TextController extends GetxController {
  String data='';
  String quantity='0.00';

  save(String pName){
    data=pName;
    update();
  }

  stockCtrl(String stock){
    quantity=stock;
  }

}

class TextController2 extends GetxController {
  String sName='';

  save(String data){
    sName=data;
    update();
  }

}
