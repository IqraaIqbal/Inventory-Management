// ignore_for_file: prefer_const_constructors

import 'package:stock_management/linker.dart';

final user = FirebaseAuth.instance.currentUser!;

Future<void> deleteUser() async {
  try {

    DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc(user.uid);

    await userRef.delete();
      Get.snackbar(
        'Operation Successful',
        'Account Deleted',
      );
      Get.to(AccountScreen());
  } catch (e) {
    Get.snackbar(
      'Ooops!',
      'Error Deleting User',
    );
  }
}

