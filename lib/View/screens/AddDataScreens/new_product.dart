// ignore_for_file: unused_local_variable

import 'package:stock_management/linker.dart';

class NewProducts extends StatelessWidget {
  const NewProducts({Key? key}) : super(key: key);

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
            text: 'New Product', fontWeight: FontWeight.bold, fontsize: 14),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    addProducts(
                        user.uid,
                        pidController.text,
                        pNameController.text,
                        stockController.text,
                        '0.00',
                        stockController.text,
                        descController.text);
                  },
                  child: const SaveButton(),
                ),
              ],
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
                controller: pNameController,
              ),
              const SizedBox(
                height: 10,
              ),
              OneLineEntryField(
                text: "Product Id\n (Unique)",
                HintText: 'Enter Product Id',
                controller: pidController,
              ),
              const SizedBox(
                height: 10,
              ),
              MultiLineTextField(
                text: 'Description',
                hintText: 'Enter Product Description',
                descriptionController: descController,
              ),
              const SizedBox(
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
                              const Text('*',style: TextStyle(
                                color: Colors.red
                              ),),
                            ],
                          ),
                          (con.button == false)
                              ? const SizedBox()
                              : Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    CustomTextField(
                                      HintText: 'Enter Stock Limit',
                                      controller: stockController,
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
