import 'package:stock_management/linker.dart';


Loading controller = Get.put(Loading());

Future signUp<Loading>(
    bNameController,
    emailController,
    userNameController,
    confirmPassController,
    passwordController,
    addressController,
    phoneController,
    currencyController,
    profilePhoto
    ) async {
  try {
    if (bNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        userNameController.text.isNotEmpty &&
        confirmPassController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      if (passwordController.text == confirmPassController.text) {
        if (passwordController.text.length > 5) {

          controller.isClickedTrue();

          UserCredential userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );

          String uid = userCredential.user!.uid;

           try{
             await FirebaseFirestore.instance.collection('users').doc(uid).set({
               'uid': uid,
               'userName': userNameController.text,
               'email': emailController.text,
               'business': bNameController.text,
               'address':  addressController.text,
               'phone': phoneController.text,
               'currency': currencyController.text,
               'profilePhoto' : profilePhoto,
             });
           }

           catch(e){
             Get.snackbar(
               'Error Saving User Data',
               e.toString(),
             );
           }
          Get.to(HomeScreen());

        } else {
          Get.snackbar(
            'Error Creating Account',
            'Passwords must contain atleast 6 characters',
          );
        }
      } else {
        Get.snackbar(
          'Error Creating Account',
          'Passwords do not match',
        );
      }
    } else {
      Get.snackbar(
        'Error Creating Account',
        'Please enter all the fields',
      );
    }
  } catch (e) {
    Get.snackbar(
      'Error Creating Account',
      e.toString(),
    );
  }
}


