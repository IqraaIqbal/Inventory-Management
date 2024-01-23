import 'package:stock_management/linker.dart';

Future resetPassword(emailController) async {
  try {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text.trim());
    Get.snackbar(
      'Link Sent',
      'Please check your mail to reset Password',
    );
    Get.to(ExistingAccount());
  } catch (e) {
    Get.snackbar(
      'Error Sending Link',
      e.toString(),
    );
  }
}
