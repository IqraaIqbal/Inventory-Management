// ignore_for_file: must_be_immutable

import 'package:stock_management/linker.dart';

class StoreListTile extends StatelessWidget {
  String text;
  String id;
  StoreListTile({required this.text, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.tealAccent.shade100,
          child: const Icon(
            Icons.cottage_sharp,
            color: Colors.teal,
            size: 20,
          ),
        ),
        title:
            CustomText(text: text, fontWeight: FontWeight.w400, fontsize: 13),
        trailing: InkWell(
            onTap: () {
              deleteDialog(() {
                deleteStore(id);
                Get.back();
              }, 'Are you sure you want to delete this Store?', text);
            },
            child: const Icon(
              Icons.delete,
              color: MyColors.iconColor,
              size: 20,
            )),
      ),
    );
  }
}
