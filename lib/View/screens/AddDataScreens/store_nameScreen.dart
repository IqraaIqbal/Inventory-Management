// ignore_for_file: unused_local_variable

import 'package:stock_management/linker.dart';

class StoreNameScreen extends StatelessWidget {
  const StoreNameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextController2 controller = Get.put(TextController2());
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.backgroundColor,
      ),
      body: Container(
        color: MyColors.backgroundColor,
        height: height,
        width: width,
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection("stock")
              .doc(user.uid)
              .collection('userStore')
              .snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: CustomText(
                        text: 'Add Product First',
                        fontWeight: FontWeight.bold,
                        fontsize: 15),
                  );
                }
                return GetBuilder<TextController2>(
                  builder: (con) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.white,
                            height: 65,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      con.save(snapshot.data!.docs[index]
                                          ['storeName']);
                                      Get.back();
                                    },
                                    child: Row(
                                      children: [
                                        CustomText(
                                            text: snapshot.data!.docs[index]
                                                ['storeName'],
                                            fontWeight: FontWeight.bold,
                                            fontsize: 13),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 1.0,
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                );

              case ConnectionState.active:
              case ConnectionState.done:
                // Handle the case when data is fully loaded
                if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: CustomText(
                        text: 'Add Product First',
                        fontWeight: FontWeight.bold,
                        fontsize: 15),
                  );
                }
                return GetBuilder<TextController2>(
                  builder: (con) {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.white,
                            height: 65,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      con.save(snapshot.data!.docs[index]
                                          ['storeName']);
                                      Get.back();
                                    },
                                    child: Row(
                                      children: [
                                        CustomText(
                                            text: snapshot.data!.docs[index]
                                                ['storeName'],
                                            fontWeight: FontWeight.bold,
                                            fontsize: 13),
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    thickness: 1.0,
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                );
            }
          },
        ),
        // child: StreamBuilder(
        //     stream: FirebaseFirestore.instance
        //         .collection("stock")
        //         .doc(user.uid)
        //         .collection('userStore')
        //         .snapshots(),
        //     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //       if (snapshot.hasData) {
        //         return GetBuilder<TextController2>(
        //           builder: (con) {
        //             return ListView.builder(
        //                 itemCount: snapshot.data!.docs.length,
        //                 shrinkWrap: true,
        //                 itemBuilder: (context, index) {
        //                   return Container(
        //                     color: Colors.white,
        //                     height: 65,
        //                     child: Padding(
        //                       padding: const EdgeInsets.all(12.0),
        //                       child: Column(
        //                         mainAxisAlignment:
        //                             MainAxisAlignment.spaceBetween,
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           SizedBox(
        //                             height: 5,
        //                           ),
        //                           InkWell(
        //                             onTap: () {
        //                               con.save(snapshot.data!.docs[index]
        //                                   ['storeName']);
        //                               Get.back();
        //                             },
        //                             child: Row(
        //                               children: [
        //                                 CustomText(
        //                                     text: snapshot.data!.docs[index]
        //                                         ['storeName'],
        //                                     fontWeight: FontWeight.bold,
        //                                     fontsize: 13),
        //                               ],
        //                             ),
        //                           ),
        //                           const Divider(
        //                             thickness: 1.0,
        //                           ),
        //                         ],
        //                       ),
        //                     ),
        //                   );
        //                 });
        //           },
        //         );
        //       } else {
        //         return Center(
        //           child: CustomText(
        //               text: 'Add Product First',
        //               fontWeight: FontWeight.bold,
        //               fontsize: 15),
        //         );
        //       }
        //     }),
      ),
    );
  }
}
