import 'package:stock_management/linker.dart';

void addProducts(
    uid, pid, productName, itemsIn, itemsOut, stock, description) async {
  try {
    // Get a reference to the user document
    DocumentReference userRef =
        FirebaseFirestore.instance.collection('stock').doc(uid).collection('userProducts').doc();

    await userRef.set(
      {
        'pid': pid,
        'productName': productName,
        'itemsIn': itemsIn,
        'itemsOut': itemsOut,
        'stock': stock,
        'description': description
      },
    ).then((value) => Get.to(ProductScreen()));

    Get.snackbar('Congrats!', 'New Product Added');
  } catch (e) {
    Get.snackbar(
      'Error Adding New Product',
      e.toString(),
    );
  }
}
