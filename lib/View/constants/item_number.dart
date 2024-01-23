// ignore_for_file: must_be_immutable

import 'package:stock_management/linker.dart';

class ItemNumber extends StatelessWidget {
  String productnameController;
  String quantityController;
  String priceController;
  String amountController;
  ItemNumber(
      {required this.productnameController,
      required this.quantityController,
      required this.priceController,
      required this.amountController});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
            text: '$productnameController',
            fontWeight: FontWeight.bold,
            fontsize: 13),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
                text: 'Quantity', fontWeight: FontWeight.normal, fontsize: 13),
            CustomText(
                text: '$quantityController',
                fontWeight: FontWeight.bold,
                fontsize: 13),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
                text: 'Price', fontWeight: FontWeight.normal, fontsize: 13),
            CustomText(
                text: '\$ $priceController',
                fontWeight: FontWeight.bold,
                fontsize: 13),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
                text: 'Amount', fontWeight: FontWeight.normal, fontsize: 13),
            CustomText(
                text: '\$ $amountController',
                fontWeight: FontWeight.bold,
                fontsize: 13),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
