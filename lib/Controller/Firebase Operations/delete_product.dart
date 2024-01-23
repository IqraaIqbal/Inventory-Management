import 'package:stock_management/linker.dart';

Future<void> deleteProduct(id) async {
  try {

    DocumentReference userRef = FirebaseFirestore.instance.collection('stock').doc(user.uid).collection('userProducts').doc(id);
    await userRef.delete().then((value) => Get.to(ProductScreen()));

    Get.snackbar(
      'Operation Successful',
      'Product Deleted',
    );

  } catch (e) {
    Get.snackbar(
      'Ooops!',
      'Error Deleting Product',
    );
  }
}