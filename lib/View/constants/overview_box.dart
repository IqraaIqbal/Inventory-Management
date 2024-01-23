// ignore_for_file: unused_local_variable

import 'package:stock_management/linker.dart';

class OverviewBox extends StatelessWidget {
  OverviewBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    double c = 0.0;
    double d = 0.0;

    return Container(
      decoration: BoxDecoration(
        color: MyColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: MyColors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        '     Overview',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: MyColors.primaryColor),
                      )
                    ],
                  ),
                  // StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  //   stream: FirebaseFirestore.instance
                  //       .collection('stock')
                  //       .doc(user.uid)
                  //       .collection('userProducts')
                  //       .snapshots(),
                  //   builder: (context, snapshot) {
                  //     switch (snapshot.connectionState) {
                  //       case ConnectionState.waiting:
                  //       case ConnectionState.none:
                  //         if (snapshot.data == null ||
                  //             snapshot.data!.docs.isEmpty) {
                  //           return OverviewList(
                  //             text: 'Total IN',
                  //             icon: Icons.save_alt_outlined,
                  //             value: '0',
                  //             iconColor: Colors.green,
                  //           );
                  //         }
                  //         return ListView.builder(
                  //             itemCount: 1,
                  //             shrinkWrap: true,
                  //             itemBuilder: (context, index) {
                  //               return OverviewList(
                  //                 text: 'Total IN',
                  //                 icon: Icons.save_alt_outlined,
                  //                 value: d.toString(),
                  //                 iconColor: Colors.green,
                  //               );
                  //             });
                  //
                  //       case ConnectionState.active:
                  //       case ConnectionState.done:
                  //         // Handle the case when data is fully loaded
                  //         if (snapshot.data == null ||
                  //             snapshot.data!.docs.isEmpty) {
                  //           return OverviewList(
                  //             text: 'Total IN',
                  //             icon: Icons.save_alt_outlined,
                  //             value: '0',
                  //             iconColor: Colors.green,
                  //           );
                  //         }
                  //
                  //         return ListView.builder(
                  //             itemCount: 1,
                  //             shrinkWrap: true,
                  //             itemBuilder: (context, index) {
                  //               for (double a = 0;
                  //               a < snapshot.data!.docs.length;
                  //               a++) {
                  //                 double b = double.parse(
                  //                     snapshot.data!.docs[a.toInt()]['itemsIn']);
                  //                 d = d + b;
                  //               }
                  //               return OverviewList(
                  //                 text: 'Total IN',
                  //                 icon: Icons.save_alt_outlined,
                  //                 value: d.toString(),
                  //                 iconColor: Colors.green,
                  //               );
                  //             });
                  //     }
                  //   },
                  // ),
                  // StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  //   stream: FirebaseFirestore.instance
                  //       .collection('stock')
                  //       .doc(user.uid)
                  //       .collection('userProducts')
                  //       .snapshots(),
                  //   builder: (context, snapshot) {
                  //     switch (snapshot.connectionState) {
                  //       case ConnectionState.waiting:
                  //       case ConnectionState.none:
                  //         if (snapshot.data == null ||
                  //             snapshot.data!.docs.isEmpty) {
                  //           return OverviewList(
                  //               text: 'Total Out',
                  //               icon: Icons.file_upload_outlined,
                  //               value: '0',
                  //               iconColor: Colors.orange);
                  //         }
                  //         return ListView.builder(
                  //             itemCount: 1,
                  //             shrinkWrap: true,
                  //             itemBuilder: (context, index) {
                  //               return OverviewList(
                  //                   text: 'Total Out',
                  //                   icon: Icons.file_upload_outlined,
                  //                   value: c.toString(),
                  //                   iconColor: Colors.orange);
                  //             });
                  //
                  //       case ConnectionState.active:
                  //       case ConnectionState.done:
                  //         // Handle the case when data is fully loaded
                  //         if (snapshot.data == null ||
                  //             snapshot.data!.docs.isEmpty) {
                  //           return OverviewList(
                  //               text: 'Total Out',
                  //               icon: Icons.file_upload_outlined,
                  //               value: '0',
                  //               iconColor: Colors.orange);
                  //         }
                  //         return ListView.builder(
                  //             itemCount: 1,
                  //             shrinkWrap: true,
                  //             itemBuilder: (context, index) {
                  //               for (double a = 0;
                  //                   a < snapshot.data!.docs.length;
                  //                   a++) {
                  //                 double b = double.parse(
                  //                     snapshot.data!.docs[a.toInt()]['itemsOut']);
                  //                 c = c + b;
                  //               }
                  //               return OverviewList(
                  //                   text: 'Total Out',
                  //                   icon: Icons.file_upload_outlined,
                  //                   value: c.toString(),
                  //                   iconColor: Colors.orange);
                  //             });
                  //     }
                  //   },
                  // ),
                  StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection('stock')
                        .doc(user.uid)
                        .collection('userProducts')
                        .snapshots(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                        case ConnectionState.none:
                          if (snapshot.data == null ||
                              snapshot.data!.docs.isEmpty) {
                            return OverviewList(
                                text: 'Products',
                                icon: Icons.shopping_bag,
                                value: '0',
                                iconColor: Colors.indigo);
                          }
                          return ListView.builder(
                              itemCount: 1,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return OverviewList(
                                    text: 'Products',
                                    icon: Icons.shopping_bag,
                                    value:
                                        snapshot.data!.docs.length.toString(),
                                    iconColor: Colors.indigo);
                              });

                        case ConnectionState.active:
                        case ConnectionState.done:
                          // Handle the case when data is fully loaded
                          if (snapshot.data == null ||
                              snapshot.data!.docs.isEmpty) {
                            return OverviewList(
                                text: 'Products',
                                icon: Icons.shopping_bag,
                                value: '0',
                                iconColor: Colors.indigo);
                          }
                          return ListView.builder(
                              itemCount: 1,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return OverviewList(
                                    text: 'Products',
                                    icon: Icons.shopping_bag,
                                    value:
                                        snapshot.data!.docs.length.toString(),
                                    iconColor: Colors.indigo);
                              });
                      }
                    },
                  ),
                  // ListView.builder(
                  //     itemCount: 1,
                  //     shrinkWrap: true,
                  //     itemBuilder: (context, index) {
                  //       return OverviewList(
                  //           text: 'In Hand',
                  //           icon: Icons.real_estate_agent_sharp,
                  //           value: (d-c).toString(),
                  //           iconColor: Colors.purple);
                  //     }),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //----------------------Product In Button------------------------------
              InkWell(
                onTap: () {
                  Get.to(ProductInOut());
                },
                child: Container(
                  height: 30,
                  width: width / 3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_circle_outline_rounded),
                        Text(' Product In'),
                      ],
                    ),
                  ),
                ),
              ),
              //----------------------Product Out Button------------------------------
              InkWell(
                onTap: () {
                  Get.to(ProductInOut());
                },
                child: Container(
                  height: 30,
                  width: width / 3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_circle_outline_rounded),
                        Text(' Product Out'),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
