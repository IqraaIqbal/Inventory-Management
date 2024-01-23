// ignore_for_file: must_be_immutable

import 'package:stock_management/linker.dart';

class CustomTextField extends StatelessWidget {
  final String HintText;
  final TextEditingController? controller;
  int numLines;
  final ValueChanged<String>? onChanged;
  CustomTextField({
    required this.HintText,
    this.numLines = 1,
    this.controller = null,
    this.onChanged = null,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: MyColors.button,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2.0, color: Colors.grey.shade300)),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 7.0, left: 10.0),
        child: TextField(
          controller: controller,
          maxLines: numLines,
          onChanged: onChanged,
          decoration: InputDecoration(
              hintText: HintText,
              hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade400),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
