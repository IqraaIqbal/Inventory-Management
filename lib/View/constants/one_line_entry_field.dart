// ignore_for_file: must_be_immutable, non_constant_identifier_names, unused_local_variable

import 'package:stock_management/linker.dart';

class OneLineEntryField extends StatelessWidget {
  String text;
  String symbol;
  String HintText;
  final controller;
  final ValueChanged<String>? onChanged;
  OneLineEntryField(
      {required this.text,
      this.symbol = '*',
      this.controller,
      required this.HintText,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomText(text: text, fontWeight: FontWeight.w500, fontsize: 14),
            Text(
              symbol,
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        Container(
          height: 50,
          width: width - 140,
          decoration: BoxDecoration(
            // color: MyColors.primaryColor,
            borderRadius: BorderRadius.circular(13),
          ),
          child: CustomTextField(
            HintText: HintText,
            controller: controller,
            onChanged: onChanged,
          ),
        )
      ],
    );
  }
}
