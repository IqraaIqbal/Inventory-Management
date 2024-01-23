import 'package:stock_management/linker.dart';

Loading cont = Get.put(Loading());
// sign user in method
void signUserIn<Loading>(emailController,passwordController) async {
  try {

    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      cont.isClickedTrue();

      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      Get.to(HomeScreen());
    } else {
      Get.snackbar(
        'Error Logging in',
        'Please enter all the fields',
      );
    }
  } catch (e) {
    Get.snackbar(
      'Error Logging in',
      e.toString(),
    );
  }
}
