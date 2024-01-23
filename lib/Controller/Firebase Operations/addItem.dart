import 'package:stock_management/linker.dart';


void addItem(
  itemsIn,
  itemsOut,
) async {
  try {
    int stock = itemsIn - itemsOut;
    // Get a reference to the user document
    DocumentReference userRef =
    FirebaseFirestore.instance
        .collection('stock')
        .doc(user.uid)
        .collection('items')
        .doc(user.uid);

    await userRef.set({
      'itemsIn': itemsIn,
      'itemsOut': itemsOut,
      'stock': stock,
    }, SetOptions(merge: true));

    Get.to(ItemPage());

    Get.snackbar('Operation Successful', 'Item Added');
  } catch (e) {
    Get.snackbar(
      'Error Adding Item',
      e.toString(),
    );
  }
}
