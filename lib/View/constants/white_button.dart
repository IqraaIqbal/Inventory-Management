// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:stock_management/linker.dart';

class WhiteButton extends StatelessWidget {
  String text;
  WhiteButton({required this.text});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Container(
      height: 50,
      width: width - 120,
      decoration: BoxDecoration(
        color: MyColors.button,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: CustomText(
          text: text,
          fontWeight: FontWeight.bold,
          fontsize: 13,
        ),
      ),
    );
  }
}
