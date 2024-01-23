// ignore_for_file: must_be_immutable, unused_local_variable


import 'package:stock_management/linker.dart';

class NewItem extends StatefulWidget {
  String pName;
  String itemAmount;
  String pid;
  String itemsIn;

  NewItem(
      {required this.pName,
      required this.itemAmount,
      required this.pid,
      required this.itemsIn});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  TextEditingController pNameController = TextEditingController();

  TextEditingController itemPriceController = TextEditingController(text: '0');

  TextEditingController itemQuantityController =
      TextEditingController(text: '0');

  TextEditingController description = TextEditingController();

  int itemPrice = 0;

  int itemQuantity = 0;

  int amount = 0;

  @override
  Widget build(BuildContext context) {
    int stock = int.parse(widget.itemsIn);
    Add controller = Get.put(Add());
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
            text: 'Add Item', fontWeight: FontWeight.bold, fontsize: 14),
        backgroundColor: MyColors.backgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GetBuilder<Add>(
              builder: (controller) {
                return InkWell(
                  onTap: () {
                    stock = int.parse(widget.itemsIn) -
                        int.parse(itemQuantityController.text);
                    controller.isPressed();
                    controller.updateHeight();
                    controller.data(
                        pNameController.text,
                        itemQuantityController.text,
                        itemPriceController.text,
                        widget.pid);
                    Navigator.pop(context); // First pop
                    Navigator.pop(context); // Second pop
                  },
                  child: const SaveButton(),
                );
              },
            ),
          ),
        ],
      ),
      body: Container(
        color: MyColors.backgroundColor,
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OneLineEntryField(
                text: 'Item Name',
                HintText: "Enter Product Name",
                controller: pNameController..text = widget.pName,
              ),
              const SizedBox(
                height: 10,
              ),
              OneLineEntryField(
                text: "Item Price",
                symbol: '',
                HintText: 'Enter Item Price',
                controller: itemPriceController,
                onChanged: (value) {
                  setState(() {
                    itemPrice = int.parse(value);
                    amount = itemPrice * itemQuantity;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              OneLineEntryField(
                text: "Item Quantity",
                symbol: '',
                HintText: 'Enter Item Quantity',
                controller: itemQuantityController,
                onChanged: (value) {
                  setState(() {
                    itemQuantity = int.parse(value);
                    stock = int.parse(widget.itemsIn) - itemQuantity;
                    amount = itemPrice * itemQuantity;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                  text: 'Current Stock : $stock',
                  fontWeight: FontWeight.normal,
                  fontsize: 13),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          text: 'Amount',
                          fontWeight: FontWeight.normal,
                          fontsize: 13),
                      InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: CustomText(
                            text: '\$ $amount',
                            fontWeight: FontWeight.bold,
                            fontsize: 13),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              OneLineEntryField(
                text: "Description",
                symbol: '',
                HintText: 'Enter Description',
                controller: description,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
