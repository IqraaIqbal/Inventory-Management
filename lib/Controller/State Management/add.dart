import 'package:stock_management/linker.dart';

class Add extends GetxController {
  int button = 0;
  double heightCon = 80;
  String name='';
  String quantity='';
  String price='';
  int am=0;
  String amount='';
  String Id='';

  isPressed() {
    button++;
    update();
  }

  updateHeight() {
    heightCon = 165;
  }

  data(String pName,String itemQuantity,String rate,String itemId){
    name=pName;
    quantity=itemQuantity;
    price=rate;
    am= int.parse(price)*int.parse(quantity);
    amount=am.toString();
    Id=itemId;
    print("name: $name, q: $quantity, p: $price, am: $amount, id: $Id");
    update();

  }

}
