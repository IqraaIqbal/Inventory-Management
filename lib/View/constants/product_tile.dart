// ignore_for_file: must_be_immutable

import 'package:stock_management/linker.dart';

class ProductTile extends StatelessWidget {
  String heading;
  String id;
  String pid;
  String itemIn;
  String itemOut;
  String desc;
  ProductTile(
      {required this.heading,
      required this.id,
      required this.pid,
      required this.itemIn,
      required this.itemOut,
      required this.desc});

  double get remainingItems {
    // Convert itemIn and itemOut back to double before performing calculations
    double inValue = double.tryParse(itemIn) ?? 0;
    double outValue = double.tryParse(itemOut) ?? 0;
    return inValue - outValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: MyColors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            text: heading,
                            fontWeight: FontWeight.bold,
                            fontsize: 14),
                        CustomText(
                            text: '$pid',
                            fontWeight: FontWeight.normal,
                            fontsize: 13),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_drop_up,
                              color: Colors.green.shade800,
                            ),
                            Text(
                              '$itemIn',
                              style: TextStyle(
                                color: Colors.green.shade800,
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.orange.shade800,
                            ),
                            Text(
                              '$itemOut',
                              style: TextStyle(
                                color: Colors.orange.shade800,
                              ),
                            ),
                            Text(
                              ' = $remainingItems',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          height: 1.0,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Dialogue();
                      },
                      child: const CircleAvatar(
                        radius: 20,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: MyColors.iconColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Dialogue() {
    return Get.defaultDialog(
      title: '',
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.to(ProductInOut());
                },
                child: Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade700,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                      child: Text(
                    'Transaction',
                    style: TextStyle(
                        color: MyColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  )),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(EditProducts(
                      heading: heading,
                      id: id,
                      pid: pid,
                      itemIn: itemIn,
                      desc: desc));
                },
                child: const CircleAvatar(
                  radius: 17,
                  child: Icon(
                    Icons.edit_outlined,
                    color: MyColors.iconColor,
                    size: 17,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.back();
                  deleteDialog(() {
                    deleteProduct(id);
                    Get.back();
                  }, 'Are you sure you want to delete this product', heading);
                },
                child: const CircleAvatar(
                  radius: 17,
                  child: Icon(
                    Icons.delete_outline,
                    color: MyColors.iconColor,
                    size: 17,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: const CircleAvatar(
                  radius: 17,
                  child: Icon(
                    Icons.cancel_outlined,
                    color: MyColors.iconColor,
                    size: 17,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              CustomText(
                  text: heading, fontWeight: FontWeight.bold, fontsize: 13),
            ],
          ),
          Row(
            children: [
              CustomText(
                  text: 'PID - $pid',
                  fontWeight: FontWeight.normal,
                  fontsize: 13)
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          const Divider(
            height: 1.0,
            color: Colors.grey,
          ),
          OverviewList(
              text: 'Total IN',
              icon: Icons.save_alt_outlined,
              value: itemIn,
              iconColor: Colors.green),
          OverviewList(
              text: 'Total OUT',
              icon: Icons.file_upload_outlined,
              value: itemOut,
              iconColor: Colors.orange),
          OverviewList(
              text: 'IN Hand',
              icon: Icons.real_estate_agent_sharp,
              value: '$remainingItems',
              iconColor: Colors.purple),
          const Divider(
            height: 1.0,
            color: Colors.grey,
          ),
          Row(
            children: [
              CustomText(
                  text: 'Description : ',
                  fontWeight: FontWeight.w600,
                  fontsize: 13),
              CustomText(text: desc, fontWeight: FontWeight.w600, fontsize: 13),
            ],
          )
        ],
      ),
    );
  }
}
