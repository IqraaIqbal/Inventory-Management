import 'package:stock_management/linker.dart';

void changePassword(passwordController, confirmPassController) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    if(passwordController.text==confirmPassController.text){
      try {
        await user.updatePassword(passwordController.text);
        // Password updated successfully
        Get.to(HomeScreen());
        Get.snackbar(
          'Congratulations!',
          'Password Updated Successfully',
        );

      } catch (e) {
        // Handle password update failure
        Get.snackbar(
          'Error updating Password',
          e.toString(),
        );
      }
    }
  }
}