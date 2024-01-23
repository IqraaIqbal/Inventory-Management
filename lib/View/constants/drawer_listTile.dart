// ignore_for_file: must_be_immutable

import 'package:stock_management/linker.dart';

class DrawerListTile extends StatelessWidget {
  IconData icon;
  String text;
  DrawerListTile({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: MyColors.iconColor,
            size: 25,
          ),
          title:
              CustomText(text: text, fontWeight: FontWeight.bold, fontsize: 13),
          trailing: const Icon(
            Icons.arrow_forward_ios_sharp,
            color: MyColors.iconColor,
            size: 12,
          ),
          visualDensity: const VisualDensity(vertical: -4.0),
        ),
      ],
    );
  }
}
