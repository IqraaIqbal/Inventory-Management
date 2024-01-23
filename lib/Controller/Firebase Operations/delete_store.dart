import 'package:stock_management/linker.dart';

Future<void> deleteStore(id) async {
  try {

    DocumentReference userRef =  FirebaseFirestore.instance.collection('stock').doc(user.uid).collection('userStore').doc(id);
    await userRef.delete().then((value) => Get.to(StoreScreen()));
    Get.snackbar(
      'Operation Successful',
      'Store Deleted',
    );

  } catch (e) {
    Get.snackbar(
      'Ooops!',
      'Error Deleting Store',
    );
  }
}
