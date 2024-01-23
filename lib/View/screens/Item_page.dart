import 'package:stock_management/linker.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.backgroundColor,
        title: CustomText(
            text: 'Add Item', fontWeight: FontWeight.bold, fontsize: 14),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_outlined,
                  size: 18,
                  color: MyColors.iconColor,
                )),
          ),
        ],
      ),
      backgroundColor: MyColors.backgroundColor,
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
    stream: FirebaseFirestore.instance
                  .collection('stock')
                  .doc(user.uid)
                  .collection('userProducts')
                  .snapshots(),
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.waiting:
        case ConnectionState.none:
          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return Center(
                child: CustomText(
                    text: 'Add Product First',
                    fontWeight: FontWeight.normal,
                    fontsize: 14),
              );
          }
          return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 60,
                            color: MyColors.white,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(NewItem(
                                      pName: snapshot.data!.docs[index]
                                          ['productName'],
                                      itemAmount: snapshot.data!.docs[index]
                                          ['stock'],
                                      pid: snapshot.data!.docs[index]['pid'],
                                      itemsIn: snapshot.data!.docs[index]
                                          ['itemsIn'],
                                    ));
                                  },
                                  child: ListTile(
                                    leading: CustomText(
                                        text: snapshot.data!.docs[index]
                                            ['productName'],
                                        fontWeight: FontWeight.normal,
                                        fontsize: 14),
                                    trailing: CustomText(
                                        text: snapshot.data!.docs[index]['stock'],
                                        fontWeight: FontWeight.bold,
                                        fontsize: 14),
                                  ),
                                ),
                                const Divider(
                                  height: 1.0,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          );
                        });

        case ConnectionState.active:
        case ConnectionState.done:
        // Handle the case when data is fully loaded
          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return Center(
                child: CustomText(
                    text: 'Add Product First',
                    fontWeight: FontWeight.normal,
                    fontsize: 14),
              );
          }
      return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 60,
                      color: MyColors.white,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(NewItem(
                                pName: snapshot.data!.docs[index]
                                    ['productName'],
                                itemAmount: snapshot.data!.docs[index]
                                    ['stock'],
                                pid: snapshot.data!.docs[index]['pid'],
                                itemsIn: snapshot.data!.docs[index]
                                    ['itemsIn'],
                              ));
                            },
                            child: ListTile(
                              leading: CustomText(
                                  text: snapshot.data!.docs[index]
                                      ['productName'],
                                  fontWeight: FontWeight.normal,
                                  fontsize: 14),
                              trailing: CustomText(
                                  text: snapshot.data!.docs[index]['stock'],
                                  fontWeight: FontWeight.bold,
                                  fontsize: 14),
                            ),
                          ),
                          const Divider(
                            height: 1.0,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    );
                  });
      }
    },
    ),
      // body: StreamBuilder(
      //     stream: FirebaseFirestore.instance
      //         .collection('stock')
      //         .doc(user.uid)
      //         .collection('userProducts')
      //         .snapshots(),
      //     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //       if (snapshot.hasData) {
      //         return ListView.builder(
      //             itemCount: snapshot.data!.docs.length,
      //             shrinkWrap: true,
      //             itemBuilder: (context, index) {
      //               return Container(
      //                 height: 60,
      //                 color: MyColors.white,
      //                 child: Column(
      //                   children: [
      //                     GestureDetector(
      //                       onTap: () {
      //                         Get.to(NewItem(
      //                           pName: snapshot.data!.docs[index]
      //                               ['productName'],
      //                           itemAmount: snapshot.data!.docs[index]
      //                               ['stock'],
      //                           pid: snapshot.data!.docs[index]['pid'],
      //                           itemsIn: snapshot.data!.docs[index]
      //                               ['itemsIn'],
      //                         ));
      //                       },
      //                       child: ListTile(
      //                         leading: CustomText(
      //                             text: snapshot.data!.docs[index]
      //                                 ['productName'],
      //                             fontWeight: FontWeight.normal,
      //                             fontsize: 14),
      //                         trailing: CustomText(
      //                             text: snapshot.data!.docs[index]['stock'],
      //                             fontWeight: FontWeight.bold,
      //                             fontsize: 14),
      //                       ),
      //                     ),
      //                     const Divider(
      //                       height: 1.0,
      //                       color: Colors.grey,
      //                     ),
      //                   ],
      //                 ),
      //               );
      //             });
      //       } else {
      //         return Center(
      //           child: CustomText(
      //               text: 'Add Product First',
      //               fontWeight: FontWeight.normal,
      //               fontsize: 14),
      //         );
      //       }
      //     }),
    );
  }
}
