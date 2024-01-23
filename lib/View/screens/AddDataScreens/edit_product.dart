// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:stock_management/linker.dart';

class EditProducts extends StatelessWidget {
  String id;
  String heading;
  String pid;
  String itemIn;
  String desc;

  EditProducts(
      {required this.id,
      required this.heading,
      required this.pid,
      required this.itemIn,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    CheckButton controller = Get.put(CheckButton());
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    TextEditingController pNameController = TextEditingController();
    TextEditingController pidController = TextEditingController();
    TextEditingController descController = TextEditingController();
    TextEditingController stockController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
            text: 'Edit Product', fontWeight: FontWeight.bold, fontsize: 14),
        backgroundColor: MyColors.backgroundColor,
        leading: IconButton(
            onPressed: () {
              Get.to(ProductScreen());
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 17,
              color: MyColors.iconColor,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: InkWell(
              onTap: () {
                updateProduct(
                  id,
                  pidController.text,
                  pNameController.text,
                  stockController.text,
                  '0.00',
                  stockController.text,
                  descController.text,
                );
                Get.to(ProductScreen());
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
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              OneLineEntryField(
                text: 'Product Name',
                HintText: "Enter Product Name",
                controller: pNameController..text = '$heading',
              ),
              SizedBox(
                height: 10,
              ),
              OneLineEntryField(
                text: "Product Id\n (Unique)",
                HintText: 'Enter Product Id',
                controller: pidController..text = '$pid',
              ),
              SizedBox(
                height: 10,
              ),
              MultiLineTextField(
                text: 'Description',
                hintText: 'Enter Product Description',
                descriptionController: descController..text = '$desc',
              ),
              SizedBox(
                height: 10,
              ),
              GetBuilder<CheckButton>(
                builder: (con) {
                  return Container(
                    height: (con.button == false) ? 50 : 110,
                    width: width,
                    decoration: BoxDecoration(
                      color: MyColors.white,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CustomText(
                                  text: 'Stock',
                                  fontWeight: FontWeight.bold,
                                  fontsize: 13),
                            ],
                          ),
                          (con.button == false)
                              ? SizedBox()
                              : Column(
                                  children: [
                                    SizedBox(height: 10),
                                    CustomTextField(
                                      HintText: 'Enter Stock Limit',
                                      controller: stockController
                                        ..text = '$itemIn',
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
