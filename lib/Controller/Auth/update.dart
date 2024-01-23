import 'package:stock_management/linker.dart';

void updateUserData(userName,bName,address,phone) async {
  try {
    // Get a reference to the user document
    DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);

    await userRef.set(
      {
        'userName': userName,
        'business': bName,
        'address':  address,
        'phone': phone,
      },
      SetOptions(merge: true));

    Get.to(HomeScreen());

    Get.snackbar(
      'Congrats!',
      'Updated Successfully'
    );
  } catch(e){
    Get.snackbar(
      'Error Updating User Data',
      e.toString(),
    );
  }
}




