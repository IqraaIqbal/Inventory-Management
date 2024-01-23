import 'package:stock_management/linker.dart';

void updateTransaction(id,date,productName,storeName,quantity,type,stock,salesRate,purchaseRate,description) async {
  try {
    // Get a reference to the user document
    DocumentReference userRef = FirebaseFirestore.instance.collection('stock').doc(user.uid).collection('transaction').doc(id);


    await userRef.update(
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

    Get.to(TransactionScreen());

    Get.snackbar(
        'Congrats!',
        'Transaction Updated Successfully'
    );
  } catch(e){
    Get.snackbar(
      'Error Updating Transaction',
      e.toString(),
    );
  }
}