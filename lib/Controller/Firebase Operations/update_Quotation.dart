import 'package:stock_management/linker.dart';

void updateQuotation(id,date,businessName,tax,client,salesPerson,paymentMethod,productName,validity,price,quantity,subTotal,total) async {
  try {
    // Get a reference to the user document
    DocumentReference userRef = FirebaseFirestore.instance.collection('stock').doc(user.uid).collection('quotations').doc(id);

    await userRef.update(
      {
        'date': date,
        'businessName': businessName,
        'tax': tax,
        'client': client,
        'salesPerson': salesPerson,
        'paymentMethod': paymentMethod,
        'validity': validity,
        'productName' : productName,
        'price': price,
        'quantity': quantity,
        'subTotal': subTotal,
        'total': total,
      },
    );

    Get.to(QuotationScreen());

    Get.snackbar(
        'Congrats!',
        'Quotation Updated Successfully'
    );
  } catch(e){
    Get.snackbar(
      'Error Updating Quotation',
      e.toString(),
    );
  }
}