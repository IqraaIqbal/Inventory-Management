// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:stock_management/linker.dart';

class BlueButton extends StatelessWidget {
  String text;
  BlueButton({required this.text});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Container(
      height: 50,
      width: width - 50,
      decoration: BoxDecoration(
        color: MyColors.primaryColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: MyColors.white,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}
