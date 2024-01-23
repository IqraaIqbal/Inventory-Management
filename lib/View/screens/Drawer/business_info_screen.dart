import 'package:stock_management/linker.dart';

class BusinessInfoScreen extends StatelessWidget {
  BusinessInfoScreen({super.key});

  final user = FirebaseAuth.instance.currentUser!;



  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    TextEditingController bNameController = TextEditingController();

    TextEditingController userNameController = TextEditingController();

    TextEditingController addressController = TextEditingController();

    TextEditingController phoneController = TextEditingController();

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
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: MyColors.primaryColor,
                      child: Icon(Icons.person,
                          color: MyColors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(
                        text: 'Business Info',
                        fontWeight: FontWeight.bold,
                        fontsize: 15),
                    //--------------------Business Name with *-------------------
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CustomText(
                            text: 'Business Name',
                            fontWeight: FontWeight.w400,
                            fontsize: 12),
                        const Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("users")
                            .where('uid', isEqualTo: user.uid)
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => CustomTextField(
                                HintText: 'Enter Business Name',
                                controller: bNameController
                                  ..text =
                                  snapshot.data!.docs[index]['business'],
                              ),
                            );
                          } else {
                            return CustomTextField(
                              HintText: 'Enter Business Name',
                              controller: bNameController,
                            );
                          }
                        }),
                    //--------------------Address-------------------
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CustomText(
                            text: 'Address',
                            fontWeight: FontWeight.w400,
                            fontsize: 12),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("users")
                            .where('uid', isEqualTo: user.uid)
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => CustomTextField(
                                HintText: 'Enter Address',
                                controller: addressController
                                  ..text =
                                  snapshot.data!.docs[index]['address'],
                              ),
                            );
                          } else {
                            return CustomTextField(
                              HintText: 'Enter Address',
                              controller: addressController,
                            );
                          }
                        }),
                    //--------------------Phone Number-------------------
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CustomText(
                            text: 'Phone Number',
                            fontWeight: FontWeight.w400,
                            fontsize: 12),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("users")
                            .where('uid', isEqualTo: user.uid)
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => CustomTextField(
                                HintText: 'Enter Phone Number',
                                controller: phoneController
                                  ..text = snapshot.data!.docs[index]['phone'],
                              ),
                            );
                          } else {
                            return CustomTextField(
                              HintText: 'Enter Phone Number',
                              controller: phoneController,
                            );
                          }
                        }),
                    //--------------------User name with *------------------
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CustomText(
                            text: 'User name',
                            fontWeight: FontWeight.w400,
                            fontsize: 12),
                        const Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("users")
                            .where('uid', isEqualTo: user.uid)
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => CustomTextField(
                                HintText: 'Enter Username',
                                controller: userNameController
                                  ..text =
                                  snapshot.data!.docs[index]['userName'],
                              ),
                            );
                          } else {
                            return CustomTextField(
                              HintText: 'Enter Username',
                              controller: userNameController,
                            );
                          }
                        }),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 70,
                width: width,
                color: MyColors.backgroundColor,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      updateUserData(
                        userNameController.text,
                        bNameController.text,
                        addressController.text,
                        phoneController.text,
                      );
                    },
                    child: BlueButton(text: 'Update'),
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
