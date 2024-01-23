// ignore_for_file: must_be_immutable

import 'package:stock_management/linker.dart';

class OverviewList extends StatelessWidget {
  IconData icon;
  final iconColor;
  String text;
  String value;
  OverviewList(
      {required this.text,
      required this.icon,
      required this.value,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor,
        size: 18,
      ),
      title: CustomText(text: text, fontWeight: FontWeight.bold, fontsize: 13),
      trailing:
          CustomText(text: '$value', fontWeight: FontWeight.bold, fontsize: 13),
      visualDensity: VisualDensity(vertical: -4.0),
    );
  }
}
