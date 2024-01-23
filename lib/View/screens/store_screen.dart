// ignore_for_file: must_be_immutable

import 'package:stock_management/linker.dart';

class StoreScreen extends StatelessWidget {
  StoreScreen({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  TextEditingController storeNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.backgroundColor,
        title: CustomText(
            text: 'Stores', fontWeight: FontWeight.bold, fontsize: 14),
        leading: IconButton(
            onPressed: () {
              Get.to(HomeScreen());
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 17,
              color: MyColors.iconColor,
            )),
      ),
      backgroundColor: MyColors.backgroundColor,
      floatingActionButton: InkWell(
        onTap: () {
          storeNameController.clear();
          Get.defaultDialog(
              title: 'Add Store',
              titleStyle: const TextStyle(
                  color: MyColors.text,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              content: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CustomText(
                          text: 'Store Name',
                          fontWeight: FontWeight.normal,
                          fontsize: 13),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      child: CustomTextField(
                    HintText: 'Enter Store Name',
                    controller: storeNameController,
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          AddStore(user.uid, storeNameController.text);
                          Get.back();
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: MyColors.primaryColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                              child: Text(
                            'Save',
                            style: TextStyle(
                                color: MyColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: MyColors.primaryColor, width: 1.0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                              child: Text(
                            'Cancel',
                            style: TextStyle(
                                color: MyColors.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ));
        },
        child: const CircleAvatar(
            backgroundColor: MyColors.primaryColor,
            radius: 25,
            child: Icon(
              Icons.add,
              color: MyColors.white,
            )),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.cottage_sharp,
                            color: MyColors.iconColor,
                            size: 39,
                          ),
                          CustomText(
                              text: 'No Stores Found',
                              fontWeight: FontWeight.bold,
                              fontsize: 14)
                        ],
                      ),
                    );
              }
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        StoreListTile(
                          text: snapshot.data!.docs[index]['storeName'],
                          id: snapshot.data!.docs[index].id,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  });

            case ConnectionState.active:
            case ConnectionState.done:
              // Handle the case when data is fully loaded
              if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.cottage_sharp,
                            color: MyColors.iconColor,
                            size: 39,
                          ),
                          CustomText(
                              text: 'No Stores Found',
                              fontWeight: FontWeight.bold,
                              fontsize: 14)
                        ],
                      ),
                    );
              }
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        StoreListTile(
                          text: snapshot.data!.docs[index]['storeName'],
                          id: snapshot.data!.docs[index].id,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  });
          }
        },
      ),
    );
  }
}
