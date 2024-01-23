import 'package:stock_management/linker.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.backgroundColor,
        leading: IconButton(
            onPressed: () {
              Get.to(HomeScreen());
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 17,
              color: MyColors.iconColor,
            )),
        title: CustomText(
            text: 'Transactions', fontWeight: FontWeight.bold, fontsize: 14),
      ),
      backgroundColor: MyColors.backgroundColor,
      floatingActionButton: InkWell(
        onTap: () {
          Get.to(const ProductInOut());
        },
        child: const CircleAvatar(
            backgroundColor: MyColors.primaryColor,
            radius: 25,
            child: Icon(
              Icons.add,
              color: MyColors.white,
            )),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance.collection('stock').doc(user.uid).collection('transaction').snapshots(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                        case ConnectionState.none:
                          if (snapshot.data == null ||
                              snapshot.data!.docs.isEmpty) {
                      return Center(
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.data_thresholding_outlined,
                                      size: 35,
                                      color: MyColors.iconColor,
                                    ),
                                    CustomText(
                                        text: 'No Transaction Found',
                                        fontWeight: FontWeight.bold,
                                        fontsize: 14),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    CustomText(
                                        text:
                                        'Click on the Add button to Add Your Transaction',
                                        fontWeight: FontWeight.w300,
                                        fontsize: 12),
                                  ],
                                ),
                              );
                          }
                          return Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Flexible(
                                              child: CustomText(
                                                  text:
                                                  'Tip: Tap on the Transaction to Edit and LongPress to Delete',
                                                  fontWeight: FontWeight.w700,
                                                  fontsize: 14),
                                            ),
                                          ],
                                        ),
                                        ListView.builder(
                                            itemCount: snapshot.data!.docs.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    Get.to(EditTransaction(
                                                      id:snapshot.data!.docs[index].id,
                                                      date: snapshot.data!.docs[index]['date'],
                                                      productName: snapshot.data!.docs[index]['productName'],
                                                      store: snapshot.data!.docs[index]['storeName'],
                                                      quantity: snapshot.data!.docs[index]['quantity'],
                                                      stock: snapshot.data!.docs[index]['stock'],
                                                      salesrate: snapshot.data!.docs[index]['salesRate'],
                                                      purchaseRate: snapshot.data!.docs[index]['purchaseRate'],
                                                      remarks: snapshot.data!.docs[index]['description'], buttonType: snapshot.data!.docs[index]['type'],
                                                    ));
                                                  },
                                                  onLongPress: () {
                                                    deleteDialog(() {
                                                      deleteTransaction(snapshot.data!.docs[index].id);
                                                      Get.back();
                                                    },
                                                        'Do you really want to Delete this Transaction',
                                                        snapshot.data!.docs[index]['productName']);
                                                  },
                                                  child: TransactionTile(
                                                      product: snapshot.data!.docs[index]['productName'],
                                                      date: snapshot.data!.docs[index]['date'],
                                                      rate: (snapshot.data!.docs[index]['type'] == 'In')
                                                          ? snapshot.data!.docs[index]['purchaseRate']
                                                          : snapshot.data!.docs[index]['salesRate'],
                                                      store: snapshot.data!.docs[index]['storeName'],
                                                      quantity: snapshot.data!.docs[index]['quantity'],
                                                      icon: (snapshot.data!.docs[index]['type'] == 'In')
                                                          ? Icons.add
                                                          : Icons.remove),
                                                ),
                                              );
                                            }),
                                        const SizedBox(height: 50,),
                                      ],
                                    );

                        case ConnectionState.active:
                        case ConnectionState.done:
                          // Handle the case when data is fully loaded
                          if (snapshot.data == null ||
                              snapshot.data!.docs.isEmpty) {
                      return Center(
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.data_thresholding_outlined,
                                      size: 35,
                                      color: MyColors.iconColor,
                                    ),
                                    CustomText(
                                        text: 'No Transaction Found',
                                        fontWeight: FontWeight.bold,
                                        fontsize: 14),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    CustomText(
                                        text:
                                        'Click on the Add button to Add Your Transaction',
                                        fontWeight: FontWeight.w300,
                                        fontsize: 12),
                                  ],
                                ),
                              );
                          }
                      return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: CustomText(
                                            text:
                                            'Tip: Tap on the Transaction to Edit and LongPress to Delete',
                                            fontWeight: FontWeight.w700,
                                            fontsize: 14),
                                      ),
                                    ],
                                  ),
                                  ListView.builder(
                                      itemCount: snapshot.data!.docs.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                                          child: InkWell(
                                            onTap: () {
                                              Get.to(EditTransaction(
                                                id:snapshot.data!.docs[index].id,
                                                date: snapshot.data!.docs[index]['date'],
                                                productName: snapshot.data!.docs[index]['productName'],
                                                store: snapshot.data!.docs[index]['storeName'],
                                                quantity: snapshot.data!.docs[index]['quantity'],
                                                stock: snapshot.data!.docs[index]['stock'],
                                                salesrate: snapshot.data!.docs[index]['salesRate'],
                                                purchaseRate: snapshot.data!.docs[index]['purchaseRate'],
                                                remarks: snapshot.data!.docs[index]['description'], buttonType: snapshot.data!.docs[index]['type'],
                                              ));
                                            },
                                            onLongPress: () {
                                              deleteDialog(() {
                                                deleteTransaction(snapshot.data!.docs[index].id);
                                                Get.back();
                                              },
                                                  'Do you really want to Delete this Transaction',
                                                  snapshot.data!.docs[index]['productName']);
                                            },
                                            child: TransactionTile(
                                                product: snapshot.data!.docs[index]['productName'],
                                                date: snapshot.data!.docs[index]['date'],
                                                rate: (snapshot.data!.docs[index]['type'] == 'In')
                                                    ? snapshot.data!.docs[index]['purchaseRate']
                                                    : snapshot.data!.docs[index]['salesRate'],
                                                store: snapshot.data!.docs[index]['storeName'],
                                                quantity: snapshot.data!.docs[index]['quantity'],
                                                icon: (snapshot.data!.docs[index]['type'] == 'In')
                                                    ? Icons.add
                                                    : Icons.remove),
                                          ),
                                        );
                                      }),
                                  const SizedBox(height: 50,),
                                ],
                              );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
