// ignore_for_file: must_be_immutable


import 'package:stock_management/linker.dart';

class Setting extends StatelessWidget {
  Setting({Key? key}) : super(key: key);

  TextEditingController deleteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: MyColors.backgroundColor,
        title: CustomText(
            text: 'Settings', fontWeight: FontWeight.bold, fontsize: 13),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(BusinessInfoScreen());
                  },
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: MyColors.white,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.grey.shade400,
                            child: const Icon(
                              Icons.business_outlined,
                              color: MyColors.iconColor,
                              size: 23,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomText(
                              text: 'My Business',
                              fontWeight: FontWeight.bold,
                              fontsize: 14)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(ChangePassword());
                  },
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: MyColors.white,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.grey.shade400,
                            child: const Icon(
                              Icons.password_sharp,
                              color: MyColors.iconColor,
                              size: 23,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomText(
                              text: 'Change Password',
                              fontWeight: FontWeight.bold,
                              fontsize: 14)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    deleteDialog(() {
                      Get.back();
                      //---------------------2nd dialoguebox----------------------
                      Get.defaultDialog(
                        title: '',
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.delete,
                              size: 30,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomText(
                                text:
                                    'To delete current account type \'Delete\' keyword.\nThis will delete your business data, after this you will not be able to login for your business.',
                                fontWeight: FontWeight.w600,
                                fontsize: 14),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 50,
                              width: 250,
                              decoration: BoxDecoration(
                                  color: MyColors.button,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 2.0, color: Colors.grey.shade300)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Center(
                                  child: TextField(
                                    controller: deleteController,
                                    decoration: InputDecoration(
                                        hintText: 'Enter Delete Keyword',
                                        hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey.shade400),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              onTap: () {
                                if (deleteController.text == 'Delete') {
                                  deleteUser();
                                }
                                ;
                              },
                              child: Container(
                                height: 40,
                                width: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.red,
                                ),
                                child: const Center(
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: MyColors.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: const SizedBox(
                                height: 40,
                                width: 120,
                                child: Center(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }, 'Are you sure you want to delete this Account?',
                        'Delete Account');
                  },
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: MyColors.white,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.grey.shade400,
                            child: const Icon(
                              Icons.business_outlined,
                              color: MyColors.iconColor,
                              size: 23,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomText(
                              text: 'Delete My Account',
                              fontWeight: FontWeight.bold,
                              fontsize: 14),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
