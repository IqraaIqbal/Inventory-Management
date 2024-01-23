// ignore_for_file: must_be_immutable

import 'package:stock_management/linker.dart';

class TransactionTile extends StatelessWidget {
  String date;
  String product;
  String rate;
  String store;
  String quantity;
  IconData icon;

  TransactionTile(
      {required this.date,
      required this.product,
      required this.rate,
      required this.store,
      required this.quantity,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Colors.white,
      ),
      // height: 70,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
          right: 10,
          left: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 13,
                    color: MyColors.primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            TransactionListTile(
              productName: product,
              value: rate,
              storeName: store,
              quantity: quantity,
              icon: icon,
            ),
          ],
        ),
      ),
    );
  }
}
