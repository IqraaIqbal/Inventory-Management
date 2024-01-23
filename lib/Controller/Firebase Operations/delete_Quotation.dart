import 'package:stock_management/linker.dart';

Future<void> deleteQuotation(id) async {
  try {

    DocumentReference userRef = FirebaseFirestore.instance.collection('stock').doc(user.uid).collection('quotations').doc(id);
    await userRef.delete();
    Get.snackbar(
      'Operation Successful',
      'Quotation Deleted',
    );

  } catch (e) {
    Get.snackbar(
      'Ooops!',
      'Error Quotation Product',
    );
  }
}