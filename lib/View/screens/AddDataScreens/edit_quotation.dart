// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:stock_management/Controller/Firebase%20Operations/update_Quotation.dart';
import 'package:stock_management/linker.dart';

class EditQuotation extends StatefulWidget {
  String date;
  String business;
  String tax;
  String client;
  String id;
  String salesperson;
  String pName;
  String quantity;
  String price;
  String total;
  String subtotal;
  String paymentMethod;
  String validity;

  EditQuotation({
    required this.date,
    required this.business,
    required this.tax,
    required this.client,
    required this.id,
    required this.salesperson,
    required this.pName,
    required this.total,
    required this.quantity,
    required this.price,
    required this.subtotal,
    required this.paymentMethod,
    required this.validity,
  });

  @override
  State<EditQuotation> createState() => _EditQuotationState();
}

class _EditQuotationState extends State<EditQuotation> {
  String subTotal = '0';
  String total = '0';
  DateTime selectedDate = DateTime.now();

  TextEditingController dateController = TextEditingController();

  TextEditingController businessController = TextEditingController();

  TextEditingController clientController = TextEditingController();

  TextEditingController spController = TextEditingController();

  TextEditingController taxController = TextEditingController();

  TextEditingController amountController = TextEditingController();

  TextEditingController paymentMController = TextEditingController();

  TextEditingController validityController = TextEditingController();

  // show date picker method
  void _showDatePicker() {
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

  @override
  Widget build(BuildContext context) {
    CheckButton controller = Get.put(CheckButton());
    Add controller2 = Get.put(Add());
    InOutButton controller1 = Get.put(InOutButton());
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
            text: 'Add Quotation', fontWeight: FontWeight.bold, fontsize: 14),
        backgroundColor: MyColors.backgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                updateQuotation(
                    widget.id,
                    dateController.text,
                    businessController.text,
                    taxController.text,
                    clientController.text,
                    spController.text,
                    paymentMController.text,
                    widget.pName,
                    validityController.text,
                    subTotal,
                    widget.quantity,
                    subTotal,
                    total);
              },
              child: const SaveButton(),
            ),
          ),
        ],
      ),
      body: Container(
        color: MyColors.backgroundColor,
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              GetBuilder<Add>(builder: (con) {
                (widget.pName == '')
                    ? con.button = 0
                    : {con.button = 1, con.updateHeight()};
                return SizedBox();
              }),
              GetBuilder<InOutButton>(builder: (con) {
                (widget.tax == '')
                    ? {
                        con.button = 1,
                      }
                    : {
                        con.button = 2,
                      };
                return SizedBox();
              }),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GetBuilder<Add>(builder: (con) {
                    return Column(
                      children: [
                        //-------------------------Number 1------------------------------------
                        Container(
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 85,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                      text: 'Details',
                                      fontWeight: FontWeight.normal,
                                      fontsize: 12),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(
                                    height: 1.0,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    height: 30,
                                    child: Center(
                                      child: TextField(
                                        controller: dateController
                                          ..text = widget.date,
                                        decoration: InputDecoration(
                                            suffixIcon: InkWell(
                                                onTap: () {
                                                  _showDatePicker();
                                                },
                                                child: const Icon(
                                                  Icons.calendar_month_sharp,
                                                  color: MyColors.iconColor,
                                                )),
                                            hintText: 'Add Date',
                                            hintStyle: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey.shade400),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //-------------------------Number 2------------------------------------
                        Container(
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 160,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                          text: 'Business Info',
                                          fontWeight: FontWeight.normal,
                                          fontsize: 12),
                                      const Text(
                                        '*',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(
                                    height: 1.0,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      CustomText(
                                          text: 'From',
                                          fontWeight: FontWeight.bold,
                                          fontsize: 14),
                                      QuotTextField(
                                        HintText: 'Add Business',
                                        controller: businessController
                                          ..text = widget.business,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(
                                    height: 1.0,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  GetBuilder<InOutButton>(
                                    builder: (cont) {
                                      return Row(
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                cont.changeButton();
                                              },
                                              child: (cont.button == 1)
                                                  ? const Icon(
                                                      Icons.circle_outlined,
                                                      color: MyColors.iconColor,
                                                    )
                                                  : const Icon(
                                                      Icons.check_circle,
                                                      color:
                                                          MyColors.primaryColor,
                                                    )),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          (cont.button == 1)
                                              ? Column(
                                                  children: [
                                                    SizedBox(height: 10),
                                                    CustomText(
                                                        text: 'Include TAX%',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontsize: 12),
                                                  ],
                                                )
                                              : Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    CustomText(
                                                        text: 'Include TAX%',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontsize: 12),
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    Container(
                                                      height: 35,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              MyColors.button,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          border: Border.all(
                                                              width: 2.0,
                                                              color: Colors.grey
                                                                  .shade300)),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 2.0,
                                                                left: 7.0),
                                                        child: TextField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          controller:
                                                              taxController
                                                                ..text =
                                                                    widget.tax,
                                                          decoration: InputDecoration(
                                                              hintText:
                                                                  'Enter TAX%',
                                                              hintStyle: TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade400),
                                                              border:
                                                                  InputBorder
                                                                      .none),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //-------------------------Number 3------------------------------------
                        Container(
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 110,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                          text: 'Client',
                                          fontWeight: FontWeight.normal,
                                          fontsize: 12),
                                      const Text(
                                        '*',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(
                                    height: 1.0,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      CustomText(
                                          text: 'Bill To',
                                          fontWeight: FontWeight.bold,
                                          fontsize: 14),
                                      QuotTextField(
                                          controller: clientController
                                            ..text = widget.client,
                                          HintText: 'Add Client'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //-------------------------Number 4------------------------------------
                        Container(
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 85,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                          text: 'Sales Person',
                                          fontWeight: FontWeight.normal,
                                          fontsize: 12),
                                      const Text(
                                        '*',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(
                                    height: 1.0,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  QuotTextField(
                                    HintText: 'Add Sales Person',
                                    controller: spController
                                      ..text = widget.salesperson,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //-------------------------Number 5------------------------------------
                        Container(
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: con.heightCon,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                      text: 'Items',
                                      fontWeight: FontWeight.normal,
                                      fontsize: 12),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(
                                    height: 1.0,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(const ItemPage());
                                    },
                                    child: (con.button == 0)
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.add_circle_outline,
                                                color: MyColors.iconColor,
                                              ),
                                              const SizedBox(
                                                width: 7,
                                              ),
                                              CustomText(
                                                  text: 'Add Item',
                                                  fontWeight: FontWeight.bold,
                                                  fontsize: 13),
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              (widget.pName == '')
                                                  ? ItemNumber(
                                                      productnameController:
                                                          con.name,
                                                      quantityController:
                                                          con.quantity,
                                                      priceController:
                                                          con.price,
                                                      amountController:
                                                          con.amount,
                                                    )
                                                  : ItemNumber(
                                                      productnameController:
                                                          widget.pName,
                                                      quantityController:
                                                          widget.quantity,
                                                      priceController:
                                                          widget.price,
                                                      amountController:
                                                          widget.subtotal,
                                                    ),
                                              const Divider(
                                                height: 1.0,
                                                color: Colors.grey,
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.add_circle_outline,
                                                    color: MyColors.iconColor,
                                                  ),
                                                  const SizedBox(
                                                    width: 7,
                                                  ),
                                                  CustomText(
                                                      text: 'Add Item',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontsize: 13),
                                                ],
                                              ),
                                            ],
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //-------------------------Number 6------------------------------------
                        if (con.button == 0)
                          const SizedBox()
                        else
                          Container(
                            decoration: BoxDecoration(
                              color: MyColors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 120,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        text: 'Payment Details',
                                        fontWeight: FontWeight.normal,
                                        fontsize: 12),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Divider(
                                      height: 1.0,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                                text: 'Subtotal',
                                                fontWeight: FontWeight.normal,
                                                fontsize: 13),
                                            CustomText(
                                                text: (widget.subtotal == '')
                                                    ? subTotal = '${con.amount}'
                                                    : subTotal =
                                                        '${widget.subtotal}',
                                                fontWeight: FontWeight.bold,
                                                fontsize: 13),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                                text: '+ Tax%',
                                                fontWeight: FontWeight.normal,
                                                fontsize: 13),
                                            CustomText(
                                                text: '${taxController.text}',
                                                fontWeight: FontWeight.normal,
                                                fontsize: 13),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                                text: 'Total',
                                                fontWeight: FontWeight.normal,
                                                fontsize: 13),
                                            CustomText(
                                                text: (widget.tax == '')
                                                    ? total = '$subTotal'
                                                    : total = (int.parse(
                                                                subTotal) +
                                                            int.parse(
                                                                    subTotal) *
                                                                (int.parse(
                                                                    widget
                                                                        .tax)) /
                                                                100)
                                                        .toString(),
                                                fontWeight: FontWeight.bold,
                                                fontsize: 13),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        //-------------------------Number 7------------------------------------
                        Container(
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: QuotTextField(
                              HintText: 'Payment Method',
                              controller: paymentMController
                                ..text = widget.paymentMethod,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //-------------------------Number 8------------------------------------
                        Container(
                          decoration: BoxDecoration(
                            color: MyColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: QuotTextField(
                              HintText: 'Quotation Validity',
                              controller: validityController
                                ..text = widget.validity,
                            ),
                          ),
                        ),
                      ],
                    );
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
