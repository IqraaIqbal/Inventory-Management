// ignore_for_file: must_be_immutable

import 'package:stock_management/linker.dart';

class EditTransaction extends StatefulWidget {
  String id;
  String date;
  String productName;
  String store;
  String quantity;
  String stock;
  String salesrate;
  String purchaseRate;
  String remarks;
  String buttonType;

  EditTransaction(
      {required this.id,
      required this.date,
      required this.productName,
      required this.store,
      required this.quantity,
      required this.stock,
      required this.salesrate,
      required this.purchaseRate,
      required this.remarks,
      required this.buttonType});

  @override
  State<EditTransaction> createState() => _EditTransactionState();
}

class _EditTransactionState extends State<EditTransaction> {
  DateTime selectedDate = DateTime.now();

  void showDatePickermethod() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        selectedDate = value!;
      });
    });
  }

  InOutButton controller = Get.put(InOutButton());
  TextController controller1 = Get.put(TextController());
  TextController2 controller2 = Get.put(TextController2());

  @override
  Widget build(BuildContext context) {
    TextEditingController dateController = TextEditingController();
    TextEditingController quantityController = TextEditingController();
    TextEditingController purchaseController = TextEditingController();
    TextEditingController salesController = TextEditingController();
    TextEditingController remarksCon = TextEditingController();
    String type = widget.buttonType;
    String sName = '';
    String product = widget.productName;
    String stock = '';
    int newStock = 0;

    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.backgroundColor,
          title: CustomText(
              text: 'Edit Transaction',
              fontWeight: FontWeight.bold,
              fontsize: 14),
          leading: IconButton(
              onPressed: () {
                Get.to(TransactionScreen());
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 17,
                color: MyColors.iconColor,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: GetBuilder<InOutButton>(
                builder: (con) {
                  return InkWell(
                    onTap: () {
                      if (con.type == 'In') {
                        try {
                          newStock = int.parse(stock) +
                              int.parse(quantityController.text);
                          updateTransaction(
                              widget.id,
                              dateController.text,
                              product,
                              sName,
                              quantityController.text,
                              con.type,
                              newStock.toString(),
                              salesController.text,
                              purchaseController.text,
                              remarksCon.text);
                        } catch (e) {
                          // Handle parsing error here
                          Get.snackbar(
                            'Error parsing values:n',
                            e.toString(),
                          );
                        }
                      } else {
                        try {
                          newStock = int.parse(stock) -
                              int.parse(quantityController.text);
                          updateTransaction(
                              widget.id,
                              dateController.text,
                              product,
                              sName,
                              quantityController.text,
                              con.type,
                              newStock.toString(),
                              salesController.text,
                              purchaseController.text,
                              remarksCon.text);
                        } catch (e) {
                          // Handle parsing error here
                          Get.snackbar(
                            'Error parsing values:n',
                            e.toString(),
                          );
                        }
                      };
                    },
                    child: const SaveButton(),
                  );
                },
              ),
            ),
          ],
        ),
        backgroundColor: MyColors.backgroundColor,
        body: SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            color: MyColors.backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  GetBuilder<InOutButton>(builder: (con) {
                    (type == "In")
                        ? con.button = 1
                        : {con.button = 2, con.type = 'Out'};
                    return SizedBox();
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          text: 'Date',
                          fontWeight: FontWeight.w500,
                          fontsize: 14),
                      Container(
                        height: 50,
                        width: width - 140,
                        decoration: BoxDecoration(
                          color: MyColors.primaryColor,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: MyColors.button,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 2.0, color: Colors.grey.shade300)),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 7.0, left: 10.0),
                            child: TextField(
                              controller: dateController..text = widget.date,
                              decoration: InputDecoration(
                                  hintText: 'Enter Date',
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Colors.grey.shade400),
                                  suffixIcon: InkWell(
                                      onTap: () {
                                        showDatePickermethod();
                                      },
                                      child:
                                          const Icon(Icons.calendar_month_sharp)),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GetBuilder<TextController>(
                    builder: (con) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CustomText(
                                  text: 'Products',
                                  fontWeight: FontWeight.w500,
                                  fontsize: 14),
                              const Text(
                                '*',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(const ProductNameScreen());
                            },
                            child: Container(
                              height: 50,
                              width: width - 140,
                              decoration: BoxDecoration(
                                  color: MyColors.white,
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  border: Border.all(
                                      width: 2, color: Colors.grey.shade300)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, top: 12.0),
                                child: Text(
                                    (con.data == '')
                                        ? widget.productName
                                        : (product = '${con.data}'),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: MyColors.text)),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GetBuilder<TextController2>(
                    builder: (con) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CustomText(
                                  text: 'Store',
                                  fontWeight: FontWeight.w500,
                                  fontsize: 14),
                              const Text(
                                '*',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(const StoreNameScreen());
                            },
                            child: Container(
                              height: 50,
                              width: width - 140,
                              decoration: BoxDecoration(
                                  color: MyColors.white,
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  border: Border.all(
                                      width: 2, color: Colors.grey.shade300)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10.0, top: 12.0),
                                child: Text(
                                    (con.sName == '')
                                        ? widget.store
                                        : (sName = con.sName),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: MyColors.text)),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                  //------------------------Button---------------------------
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomText(
                              text: 'Select Type',
                              fontWeight: FontWeight.w500,
                              fontsize: 14),
                          const Text(
                            '*',
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                      GetBuilder<InOutButton>(
                        builder: (con) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  con.changeButton();
                                  type = con.type;
                                },
                                child: Container(
                                  height: 40,
                                  width: width / 3.5,
                                  decoration: BoxDecoration(
                                    color: con.button == 1
                                        ? Colors.green.shade700
                                        : MyColors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'IN',
                                    style: TextStyle(
                                        color: con.button == 1
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  )),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  con.changeButton();
                                  type = con.type;
                                },
                                child: Container(
                                  height: 40,
                                  width: width / 3.5,
                                  decoration: BoxDecoration(
                                    color: con.button == 2
                                        ? Colors.orange.shade700
                                        : MyColors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                      child: Text(
                                    'OUT',
                                    style: TextStyle(
                                        color: con.button == 2
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  )),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      GetBuilder<TextController>(
                        builder: (cont) {
                          return CustomText(
                              text: (cont.quantity == '0.00')
                                  ? 'Current Stock : $stock'
                                  : 'Current Stock : ${stock = cont.quantity}',
                              fontWeight: FontWeight.w600,
                              fontsize: 13);
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  OneLineEntryField(
                    text: 'Quantity',
                    HintText: 'Enter Quantity',
                    controller: quantityController..text = widget.quantity,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
          
                  //----------------------Button In Out---------------------------------
                  GetBuilder<InOutButton>(
                    builder: (con) {
                      return Column(
                        children: [
                          OneLineEntryField(
                            text:
                                (con.button == 1) ? 'Purchase Rate' : 'Sale Rate',
                            HintText: (con.button == 1)
                                ? 'Enter Purchase Rate'
                                : 'Enter Sale Rate',
                            controller: (con.button == 1)
                                ? (purchaseController..text = widget.purchaseRate)
                                : salesController
                              ..text = widget.salesrate,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    },
                  ),
                  MultiLineTextField(
                    text: 'Remarks',
                    hintText: 'Enter Remarks',
                    descriptionController: remarksCon..text = widget.remarks,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
