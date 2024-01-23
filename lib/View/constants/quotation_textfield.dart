import 'package:stock_management/linker.dart';

class QuotTextField extends StatelessWidget {
  final String HintText;
  final TextEditingController? controller;

  QuotTextField({required this.HintText, this.controller = null,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Center(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              hintText: HintText,
              hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade400),
              border: InputBorder.none),
        ),
      ),
    );
  }
}