// ignore_for_file: must_be_immutable, prefer_const_constructors, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:stock_management/linker.dart';

class ExistingAccount extends StatelessWidget {
  ExistingAccount({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // sign user in method

  @override
  Widget build(BuildContext context) {
    CheckButton controller = Get.put(CheckButton());
    InOutButton controller1 = Get.put(InOutButton());
    Loading contr = Get.put(Loading());

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
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const CircleAvatar(
                      radius: 45,
                      backgroundColor: MyColors.primaryColor,
                      child: Icon(
                        CupertinoIcons.person,
                        color: Colors.black,
                      ),
                    ),
                    //--------------------Email with *------------------
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CustomText(
                            text: 'Email',
                            fontWeight: FontWeight.bold,
                            fontsize: 12),
                        const Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                    CustomTextField(
                        HintText: 'Enter Email', controller: emailController),
                    //--------------------Password with *------------------
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CustomText(
                            text: 'Password',
                            fontWeight: FontWeight.bold,
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
                                      fontSize: 14,
                                      color: Colors.grey.shade400),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap:(){
                            Get.to(ForgetPassScreen());
                          },
                          child: CustomText(
                              text: 'Forgot Password?',
                              fontWeight: FontWeight.bold,
                              fontsize: 12),
                        ),
                      ],
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
                      height: 60,
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
                      child: GetBuilder<Loading>(
                        builder: (contr) {
                          return InkWell(
                              onTap: () {
                                signUserIn(emailController, passwordController);
                              },
                              child: ((contr).loading)?LoadingButton():BlueButton(text: 'Next'));
                        }
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
