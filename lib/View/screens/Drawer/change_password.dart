// ignore_for_file: must_be_immutable, unused_local_variable

import 'package:stock_management/linker.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({Key? key}) : super(key: key);

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CheckButton controller = Get.put(CheckButton());
    InOutButton controller1 = Get.put(InOutButton());

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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const CircleAvatar(
                    radius: 45,
                    backgroundColor: MyColors.white,
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText(
                      text: 'Change Password',
                      fontWeight: FontWeight.w500,
                      fontsize: 15),
                  //--------------------Password with *------------------
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CustomText(
                          text: 'Password',
                          fontWeight: FontWeight.w400,
                          fontsize: 12),
                      const Text(
                        '*',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                  GetBuilder<CheckButton>(
                    builder: (con) {
                      return Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: MyColors.button,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 2.0, color: Colors.grey.shade300)),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(bottom: 7.0, left: 10.0),
                          child: TextField(
                            controller: passwordController,
                            obscureText: (con.button == false) ? true : false,
                            decoration: InputDecoration(
                                hintText: 'Enter Password',
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Colors.grey.shade400),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    con.isChecked();
                                  },
                                  child: Icon((con.button == false)
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                ),
                                border: InputBorder.none),
                          ),
                        ),
                      );
                    },
                  ),
                  //--------------------Confirm Password with *------------------
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CustomText(
                          text: 'Confirm Password',
                          fontWeight: FontWeight.w400,
                          fontsize: 12),
                      const Text(
                        '*',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                  GetBuilder<InOutButton>(
                    builder: (con) {
                      return Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: MyColors.button,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 2.0, color: Colors.grey.shade300)),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(bottom: 7.0, left: 10.0),
                          child: TextField(
                            controller: confirmPassController,
                            obscureText: (con.button == 1) ? true : false,
                            decoration: InputDecoration(
                                hintText: 'Enter Confirm Password',
                                hintStyle: TextStyle(
                                    fontSize: 14, color: Colors.grey.shade400),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    con.changeButton();
                                  },
                                  child: Icon((con.button == 1)
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                ),
                                border: InputBorder.none),
                          ),
                        ),
                      );
                    },
                  ),
                  //------------------------Password-----Warning-------------------------------------
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Password must contains 1 special character,1 number,1 capital letter and must contains at least 6 characters',
                    style: TextStyle(color: Colors.redAccent, fontSize: 11),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                ],
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
                            changePassword(
                                passwordController, confirmPassController);
                          },
                          child: BlueButton(text: 'Change Password')))),
            ),
          ],
        ),
      ),
    );
  }
}
