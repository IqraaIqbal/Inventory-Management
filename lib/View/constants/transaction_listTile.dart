// ignore_for_file: must_be_immutable

import 'package:stock_management/linker.dart';

class TransactionListTile extends StatelessWidget {
  String productName;
  String value;
  String storeName;
  String quantity;
  IconData icon;

  TransactionListTile(
      {required this.productName,
      required this.value,
      required this.storeName,
      required this.quantity,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      icon,
                      color: (icon == Icons.add)
                          ? Colors.green
                          : Colors.orangeAccent,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            text: productName,
                            fontWeight: FontWeight.bold,
                            fontsize: 13),
                        CustomText(
                            text: 'Rate: \$ $value ',
                            fontWeight: FontWeight.normal,
                            fontsize: 13),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.cottage_sharp,
                          color: Colors.teal,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CustomText(
                            text: storeName,
                            fontWeight: FontWeight.normal,
                            fontsize: 13),
                      ],
                    ),
                    CustomText(
                        text: '$quantity',
                        fontWeight: FontWeight.bold,
                        fontsize: 13),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
