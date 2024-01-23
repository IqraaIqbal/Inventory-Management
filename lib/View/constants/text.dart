// ignore_for_file: must_be_immutable

import 'package:stock_management/linker.dart';

class CustomText extends StatelessWidget {
  String text;
  final FontWeight fontWeight;
  final double fontsize;
  CustomText({
    required this.text,
    required this.fontWeight,
    required this.fontsize,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        color: MyColors.text,
        fontWeight: fontWeight,
      ),
      textAlign: TextAlign.start,
    );
  }
}
