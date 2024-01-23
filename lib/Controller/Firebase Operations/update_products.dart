import 'package:stock_management/linker.dart';

void updateProduct(id,pid,productName,itemsIn,itemsOut,stock,description) async {
  try {
    // Get a reference to the user document
    DocumentReference userRef = FirebaseFirestore.instance.collection('stock').doc(user.uid).collection('userProducts').doc(id);

    await userRef.update(
        {
          'pid': pid,
          'productName': productName,
          'itemsIn': itemsIn,
          'itemsOut': itemsOut,
          'stock': stock,
          'description': description
        },
       // SetOptions(merge: true)
        ).then((value) => Get.to(ProductScreen()));


    Get.snackbar(
        'Congrats!',
        'Product Updated Successfully'
    );
  } catch(e){
    Get.snackbar(
      'Error Updating Product',
      e.toString(),
    );
  }
}
