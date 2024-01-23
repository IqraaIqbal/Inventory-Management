// ignore_for_file: unused_local_variable

import 'package:stock_management/Controller/Firebase%20Operations/addItem.dart';
import 'package:stock_management/linker.dart';

class ProductInOut extends StatefulWidget {
  const ProductInOut({super.key});

  @override
  State<ProductInOut> createState() => _ProductInOutState();
}

class _ProductInOutState extends State<ProductInOut> {
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
    TextEditingController remarks = TextEditingController();
    String type = '';
    String sName = '';
    String product = '';
    String stock = '';
    int newStock = 0;

    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.backgroundColor,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 17,
                color: MyColors.iconColor,
              )),
          title: CustomText(
              text: 'New Transaction',
              fontWeight: FontWeight.bold,
              fontsize: 14),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: GetBuilder<InOutButton>(
                builder: (con) {
                  return InkWell(
                    onTap: () {
                      if (con.type == 'In') {
                        try {
                          // StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                          //   stream: FirebaseFirestore.instance
                          //       .collection('stock')
                          //       .doc(user.uid)
                          //       .collection('items')
                          //       .snapshots(),
                          //   builder: (context, snapshot) {
                          //     switch (snapshot.connectionState) {
                          //       case ConnectionState.waiting:
                          //       case ConnectionState.none:
                          //         if (snapshot.data == null ||
                          //             snapshot.data!.docs.isEmpty) {
                          //           return OverviewList(
                          //               text: 'Products',
                          //               icon: Icons.shopping_bag,
                          //               value: '0',
                          //               iconColor: Colors.indigo);
                          //         }
                          //         return ListView.builder(
                          //             itemCount: snapshot.data!.docs.length,
                          //             shrinkWrap: true,
                          //             itemBuilder: (context, index) {
                          //               int item = int.parse(
                          //                   quantityController.text) +
                          //                   int.parse(snapshot.data!
                          //                       .docs[index]['itemsIn']);
                          //               addItem(
                          //                 item,
                          //                 0,
                          //               );
                          //               return const SizedBox();
                          //             });
                          //
                          //       case ConnectionState.active:
                          //       case ConnectionState.done:
                          //       // Handle the case when data is fully loaded
                          //         if (snapshot.data == null ||
                          //             snapshot.data!.docs.isEmpty) {
                          //           addItem(
                          //             int.parse(quantityController.text),
                          //             0,
                          //           );
                          //         }
                          //         return ListView.builder(
                          //             itemCount: snapshot.data!.docs.length,
                          //             shrinkWrap: true,
                          //             itemBuilder: (context, index) {
                          //               int item = int.parse(
                          //                   quantityController.text) +
                          //                   int.parse(snapshot.data!
                          //                       .docs[index]['itemsIn']);
                          //               addItem(
                          //                 item,
                          //                 0,
                          //               );
                          //               return const SizedBox();
                          //             });
                          //     }
                          //   },
                          // );
                          newStock = int.parse(stock) +
                              int.parse(quantityController.text);
                          print(newStock);
                          addTransaction(
                              dateController.text,
                              product,
                              sName,
                              quantityController.text,
                              con.type,
                              newStock,
                              salesController.text,
                              purchaseController.text,
                              remarks.text);
                        } catch (e) {
                          // Handle parsing error here
                          Get.snackbar(
                            'Error parsing values:n',
                            e.toString(),
                          );
                        }
                      } else {
                        try {
                          addItem(
                            0,
                            int.parse(quantityController.text),
                          );
                          newStock = int.parse(stock) -
                              int.parse(quantityController.text);
                          addTransaction(
                              dateController.text,
                              product,
                              sName,
                              quantityController.text,
                              con.type,
                              newStock.toString(),
                              salesController.text,
                              purchaseController.text,
                              remarks.text);
                        } catch (e) {
                          // Handle parsing error here
                          Get.snackbar(
                            'Error parsing values:n',
                            e.toString()
                          );
                        }
                      }
                    },
                    child: const SaveButton(),
                  );
                },
              ),
            ),
          ],
        ),
        resizeToAvoidBottomInset: true,
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
                              controller: dateController
                                ..text =
                                    '${selectedDate.day.toString()}\\${selectedDate.month.toString()}\\${selectedDate.year.toString()}',
                              decoration: InputDecoration(
                                  hintText: '',
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Colors.grey.shade400),
                                  suffixIcon: InkWell(
                                      onTap: () {
                                        showDatePickermethod();
                                      },
                                      child:
                                      const Icon(Icons.calendar_month_sharp,color: MyColors.iconColor,)),
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
                                        ? 'Enter Product Name'
                                        : (product = con.data),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: (con.data == '')
                                            ? Colors.grey.shade400
                                            : MyColors.text)),
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
                                        ? 'Enter Store Name'
                                        : (sName = con.sName),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color: (con.sName == '')
                                            ? Colors.grey.shade400
                                            : MyColors.text)),
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
                              text: 'Current Stock : ${stock = cont.quantity}',
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
                    controller: quantityController,
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
                                ? purchaseController
                                : salesController,
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
                    descriptionController: remarks,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
