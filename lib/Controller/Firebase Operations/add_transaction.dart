import 'package:stock_management/linker.dart';

TextController controller1 = Get.put(TextController());
TextController2 controller2 = Get.put(TextController2());

void addTransaction<TextController>(date,productName,storeName,quantity,type,stock,salesRate,purchaseRate,description) async {
  try {
    // Get a reference to the user document
    DocumentReference userRef = FirebaseFirestore.instance.collection('stock').doc(user.uid).collection('transaction').doc();

    await userRef.set(
      {
        'date': date,
        'productName': productName,
        'storeName' : storeName,
        'quantity': quantity,
        'type': type,
        'stock': stock,
        'salesRate': salesRate,
        'purchaseRate':purchaseRate,
        'description': description
      },
    );
    controller1.data='';
    controller1.quantity='0.00';
    controller2.sName='';
    Get.to(TransactionScreen());

    Get.snackbar(
        'Congrats!',
        'New Transaction Added'
    );
  } catch(e){
    Get.snackbar(
      'Error Adding New Transaction',
      e.toString(),
    );
  }
}
