import 'package:stock_management/linker.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.backgroundColor,
        title: CustomText(
            text: 'All Product', fontWeight: FontWeight.bold, fontsize: 14),
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
          Get.to(const NewProducts());
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
            .collection('userProducts')
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
                        const Icon(Icons.no_backpack,
                            size: 35, color: MyColors.iconColor),
                        CustomText(
                            text: 'No Products Found',
                            fontWeight: FontWeight.bold,
                            fontsize: 14),
                        const SizedBox(height: 5),
                        CustomText(
                            text: 'Click on the Add button to Add Your Product',
                            fontWeight: FontWeight.w400,
                            fontsize: 12),
                      ],
                    ),
                  ),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ProductTile(
                    heading: snapshot.data!.docs[index]['productName'],
                    pid: snapshot.data!.docs[index]['pid'],
                    itemIn: snapshot.data!.docs[index]['itemsIn'],
                    itemOut: snapshot.data!.docs[index]['itemsOut'],
                    desc: snapshot.data!.docs[index]['description'],
                    id: snapshot.data!.docs[index].id,
                  );
                },
              );

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
                        const Icon(Icons.no_backpack,
                            size: 35, color: MyColors.iconColor),
                        CustomText(
                            text: 'No Products Found',
                            fontWeight: FontWeight.bold,
                            fontsize: 14),
                        const SizedBox(height: 5),
                        CustomText(
                            text: 'Click on the Add button to Add Your Product',
                            fontWeight: FontWeight.w400,
                            fontsize: 12),
                      ],
                    ),
                  ),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ProductTile(
                    heading: snapshot.data!.docs[index]['productName'],
                    pid: snapshot.data!.docs[index]['pid'],
                    itemIn: snapshot.data!.docs[index]['itemsIn'],
                    itemOut: snapshot.data!.docs[index]['itemsOut'],
                    desc: snapshot.data!.docs[index]['description'],
                    id: snapshot.data!.docs[index].id,
                  );
                },
              );
          }
        },
      ),
    );
  }
}
