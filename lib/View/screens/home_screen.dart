// ignore_for_file: unused_local_variable

import 'package:stock_management/linker.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.backgroundColor,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection("users")
                    .where('uid', isEqualTo: user.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                        return CustomText(
                            text: 'UserName',
                            fontWeight: FontWeight.w400,
                            fontsize: 13);
                      }
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => CustomText(
                              text: "Hi ${snapshot.data!.docs[index]['userName']}!",
                              fontWeight: FontWeight.bold,
                              fontsize: 13));

                    case ConnectionState.active:
                    case ConnectionState.done:
                    // Handle the case when data is fully loaded
                      if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                        return CustomText(
                            text: 'UserName',
                            fontWeight: FontWeight.w400,
                            fontsize: 13);
                      }
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => CustomText(
                              text: "Hi ${snapshot.data!.docs[index]['userName']}!",
                              fontWeight: FontWeight.bold,
                              fontsize: 13));
                  }
                },
              ),
              CustomText(
                  text: '' + user.email!,
                  fontWeight: FontWeight.w400,
                  fontsize: 14)
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Get.to(BusinessInfoScreen());
              },
              child: const CircleAvatar(
                radius: 20,
                backgroundColor: MyColors.white,
                child: Icon(
                  Icons.person,
                  size: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: MyDrawer(),
      backgroundColor: MyColors.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              OverviewBox(),
              const SizedBox(
                height: 20,
              ),
              //-------------------staggered view-----------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(ProductScreen());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: MyColors.white,
                      ),
                      height: 100,
                      width: width / 2.3,
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.indigo.shade100,
                              child: const Icon(
                                Icons.shopping_bag,
                                color: Colors.indigo,
                                size: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                                text: 'Products',
                                fontWeight: FontWeight.bold,
                                fontsize: 14),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(StoreScreen());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: MyColors.white,
                      ),
                      height: 100,
                      width: width / 2.3,
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.tealAccent.shade100,
                              child: const Icon(
                                Icons.cottage_sharp,
                                color: Colors.teal,
                                size: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                                text: 'Stores',
                                fontWeight: FontWeight.bold,
                                fontsize: 14),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(TransactionScreen());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: MyColors.white,
                      ),
                      height: 100,
                      width: width / 2.3,
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.orangeAccent.shade100,
                              child: const Icon(
                                Icons.shopping_bag,
                                color: Colors.orange,
                                size: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomText(
                                text: 'Transactions',
                                fontWeight: FontWeight.bold,
                                fontsize: 14),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(QuotationScreen());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: MyColors.white,
                      ),
                      height: 100,
                      width: width / 2.3,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.purpleAccent.shade100,
                            child: const Icon(
                              Icons.bookmarks,
                              color: Colors.purple,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomText(
                              text: 'Quotation',
                              fontWeight: FontWeight.bold,
                              fontsize: 14),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
