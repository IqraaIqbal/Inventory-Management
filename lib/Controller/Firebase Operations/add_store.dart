// ignore_for_file: non_constant_identifier_names

import 'package:stock_management/linker.dart';

void AddStore(uid,storeName) async {
  try {
    // Get a reference to the user document
    DocumentReference userRef =
    FirebaseFirestore.instance.collection('stock').doc(uid).collection('userStore').doc();


    await userRef.set(
      {
        'storeName': storeName,
      },
    );

    Get.snackbar(
        'Congrats!',
        'New Store Added'
    );
  } catch(e){
    Get.snackbar(
      'Error Adding New Store',
      e.toString(),
    );
  }
}
