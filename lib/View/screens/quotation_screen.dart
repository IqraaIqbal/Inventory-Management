import 'package:stock_management/Controller/Firebase%20Operations/delete_Quotation.dart';
import 'package:stock_management/linker.dart';

class QuotationScreen extends StatelessWidget {
  const QuotationScreen({Key? key}) : super(key: key);

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
            text: 'Quotation', fontWeight: FontWeight.bold, fontsize: 14),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search_outlined,
                      size: 18,
                      color: MyColors.iconColor,
                    )),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: MyColors.backgroundColor,
      floatingActionButton: InkWell(
        onTap: () {
          Get.to(NewQuotation());
        },
        child: const CircleAvatar(
            backgroundColor: MyColors.primaryColor,
            radius: 25,
            child: Icon(
              Icons.add,
              color: MyColors.iconColor,
            )),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('stock')
                  .doc(user.uid)
                  .collection('quotations')
                  .snapshots(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                      return Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.book_outlined,
                                size: 35,
                                color: MyColors.iconColor,
                              ),
                              CustomText(
                                  text: 'No Quotation Found',
                                  fontWeight: FontWeight.bold,
                                  fontsize: 14),
                              const SizedBox(
                                height: 5,
                              ),
                              CustomText(
                                  text:
                                  'Click on the Add button to Add Your Quotation',
                                  fontWeight: FontWeight.w300,
                                  fontsize: 12),
                            ],
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(EditQuotation(
                                    date: snapshot.data!.docs[index]
                                    ['date'],
                                    business: snapshot.data!.docs[index]
                                    ['businessName'],
                                    tax: snapshot.data!.docs[index]['tax'],
                                    client: snapshot.data!.docs[index]
                                    ['client'],
                                    salesperson: snapshot.data!.docs[index]
                                    ['salesPerson'],
                                    total: snapshot.data!.docs[index]
                                    ['total'],
                                    subtotal: snapshot.data!.docs[index]
                                    ['subTotal'],
                                    paymentMethod: snapshot
                                        .data!.docs[index]['paymentMethod'],
                                    validity: snapshot.data!.docs[index]
                                    ['validity'],
                                    pName: snapshot.data!.docs[index]
                                    ['productName'],
                                    id: snapshot.data!.docs[index].id,
                                    quantity: snapshot.data!.docs[index]
                                    ['quantity'],
                                    price: snapshot.data!.docs[index]
                                    ['price'],
                                  ));
                                },
                                onLongPress: () {
                                  deleteDialog(() {
                                    deleteQuotation(
                                        snapshot.data!.docs[index].id);
                                    Get.back();
                                  }, 'Do You Really want to Delete this Quotation?',
                                      snapshot.data!.docs[index]['client']);
                                },
                                child: Container(
                                  //height: 80,
                                  decoration: BoxDecoration(
                                    color: MyColors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                                text: snapshot.data!
                                                    .docs[index]['client'],
                                                fontWeight: FontWeight.bold,
                                                fontsize: 13),
                                            CustomText(
                                                text:
                                                'SP: ${snapshot.data!.docs[index]['salesPerson']}',
                                                fontWeight:
                                                FontWeight.normal,
                                                fontsize: 13),
                                            CustomText(
                                                text:
                                                'Business: ${snapshot.data!.docs[index]['businessName']}',
                                                fontWeight:
                                                FontWeight.normal,
                                                fontsize: 13),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          children: [
                                            CustomText(
                                                text:
                                                '${snapshot.data!.docs[index]['date']}',
                                                fontWeight:
                                                FontWeight.normal,
                                                fontsize: 13),
                                            CustomText(
                                                text:
                                                '\$ ${snapshot.data!.docs[index]['total']}',
                                                fontWeight: FontWeight.bold,
                                                fontsize: 13),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                          //  const SizedBox(height: 50,),
                        });

                  case ConnectionState.active:
                  case ConnectionState.done:
                    // Handle the case when data is fully loaded
                    if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                return Container(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.book_outlined,
                                  size: 35,
                                  color: MyColors.iconColor,
                                ),
                                CustomText(
                                    text: 'No Quotation Found',
                                    fontWeight: FontWeight.bold,
                                    fontsize: 14),
                                const SizedBox(
                                  height: 5,
                                ),
                                CustomText(
                                    text:
                                        'Click on the Add button to Add Your Quotation',
                                    fontWeight: FontWeight.w300,
                                    fontsize: 12),
                              ],
                            ),
                          ),
                        );
                    }
                    return
                        ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(EditQuotation(
                                        date: snapshot.data!.docs[index]
                                        ['date'],
                                        business: snapshot.data!.docs[index]
                                        ['businessName'],
                                        tax: snapshot.data!.docs[index]['tax'],
                                        client: snapshot.data!.docs[index]
                                        ['client'],
                                        salesperson: snapshot.data!.docs[index]
                                        ['salesPerson'],
                                        total: snapshot.data!.docs[index]
                                        ['total'],
                                        subtotal: snapshot.data!.docs[index]
                                        ['subTotal'],
                                        paymentMethod: snapshot
                                            .data!.docs[index]['paymentMethod'],
                                        validity: snapshot.data!.docs[index]
                                        ['validity'],
                                        pName: snapshot.data!.docs[index]
                                        ['productName'],
                                        id: snapshot.data!.docs[index].id,
                                        quantity: snapshot.data!.docs[index]
                                        ['quantity'],
                                        price: snapshot.data!.docs[index]
                                        ['price'],
                                      ));
                                    },
                                    onLongPress: () {
                                      deleteDialog(() {
                                        deleteQuotation(
                                            snapshot.data!.docs[index].id);
                                        Get.back();
                                      }, 'Do You Really want to Delete this Quotation?',
                                          snapshot.data!.docs[index]['client']);
                                    },
                                    child: Container(
                                      //height: 80,
                                      decoration: BoxDecoration(
                                        color: MyColors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                CustomText(
                                                    text: snapshot.data!
                                                        .docs[index]['client'],
                                                    fontWeight: FontWeight.bold,
                                                    fontsize: 13),
                                                CustomText(
                                                    text:
                                                    'SP: ${snapshot.data!.docs[index]['salesPerson']}',
                                                    fontWeight:
                                                    FontWeight.normal,
                                                    fontsize: 13),
                                                CustomText(
                                                    text:
                                                    'Business: ${snapshot.data!.docs[index]['businessName']}',
                                                    fontWeight:
                                                    FontWeight.normal,
                                                    fontsize: 13),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                              children: [
                                                CustomText(
                                                    text:
                                                    '${snapshot.data!.docs[index]['date']}',
                                                    fontWeight:
                                                    FontWeight.normal,
                                                    fontsize: 13),
                                                CustomText(
                                                    text:
                                                    '\$ ${snapshot.data!.docs[index]['total']}',
                                                    fontWeight: FontWeight.bold,
                                                    fontsize: 13),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              );
                              //  const SizedBox(height: 50,),
                            }
                    );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
