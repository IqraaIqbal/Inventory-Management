import 'package:flutter/cupertino.dart';
import 'package:stock_management/linker.dart';

class ForgetPassScreen extends StatelessWidget {
  ForgetPassScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.backgroundColor,
      ),
      body: Container(
        height: height,
        width: width,
        color: MyColors.white,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: MyColors.backgroundColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 45,
                          backgroundColor: MyColors.primaryColor,
                          child: Icon(
                            CupertinoIcons.person,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomText(
                            text: 'Forgot Your Password',
                            fontWeight: FontWeight.w400,
                            fontsize: 15),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomText(
                            text:
                                'Please Enter your Email Address you\'d like your password reset information send to',
                            fontWeight: FontWeight.w300,
                            fontsize: 14),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            CustomText(
                                text: 'Email',
                                fontWeight: FontWeight.bold,
                                fontsize: 12),
                          ],
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        CustomTextField(
                            HintText: 'Enter Email',
                            controller: emailController),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {
                              resetPassword(emailController);
                            },
                            child: BlueButton(text: 'Request Reset Link')),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // height: 50,
                  color: MyColors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(ExistingAccount());
                        },
                        child: const Text(
                          'Back to LogIn',
                          style: TextStyle(
                            fontSize: 13,
                            color: MyColors.text,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
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
