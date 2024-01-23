import 'package:stock_management/linker.dart';

Future<void> deleteTransaction(id) async {
  try {

    DocumentReference userRef = FirebaseFirestore.instance.collection('stock').doc(user.uid).collection('transaction').doc(id);

    await userRef.delete();
    Get.snackbar(
      'Operation Successful',
      'Transaction Deleted',
    );

  } catch (e) {
    Get.snackbar(
      'Ooops!',
      'Error Transaction Product',
    );
  }
}