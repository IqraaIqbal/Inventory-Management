import 'package:stock_management/linker.dart';

Loading controller = Get.put(Loading());

// sign user out method
void signUserOut<Loading>() async {
  FirebaseAuth.instance.signOut();
  controller.isClickedFalse();
}
