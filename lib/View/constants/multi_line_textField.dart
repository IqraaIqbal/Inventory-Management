// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:stock_management/linker.dart';

class MultiLineTextField extends StatelessWidget {
  String text;
  String hintText;
  final TextEditingController? descriptionController;
  MultiLineTextField(
      {required this.text, required this.hintText, this.descriptionController});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: text, fontWeight: FontWeight.w500, fontsize: 14),
        Container(
          height: 70,
          width: width - 140,
          decoration: BoxDecoration(
            color: MyColors.primaryColor,
            borderRadius: BorderRadius.circular(13),
          ),
          child: CustomTextField(
              controller: descriptionController,
              HintText: hintText,
              numLines: 10),
        )
      ],
    );
  }
}
