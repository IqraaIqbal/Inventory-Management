import 'package:stock_management/linker.dart';
//int ind=0;

void addQuotation(date,businessName,tax,client,salesPerson,paymentMethod,productName,validity,price,quantity,subTotal,total) async {

 // ind++;
  try {

    //String index=ind.toString();
    // Get a reference to the user document
    DocumentReference userRef = FirebaseFirestore.instance.collection('stock').doc(user.uid).collection('quotations').doc();

    await userRef.set(
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
        'New Quotation Added'
    );
  } catch(e){
    Get.snackbar(
      'Error Adding New Quotation',
      e.toString(),
    );
  }
}
