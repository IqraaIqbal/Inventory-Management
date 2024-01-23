import 'package:stock_management/linker.dart';

class ItemData extends GetxController {
  String name='';
  String amount='';
  String price='';

  save(String pName,String quantity,String rate){
    name=pName;
    amount=quantity;
    price=rate;
    update();
  }
}

// class TextController2 extends GetxController {
//   String sName='';
//
//   save(String data){
//     sName=data;
//     update();
//   }
//
// }