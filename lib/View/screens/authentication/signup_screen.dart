// ignore_for_file: prefer_const_constructors_in_immutables, unused_local_variable

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';


import 'package:stock_management/linker.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController bNameController = TextEditingController();

  TextEditingController confirmPassController = TextEditingController();

  TextEditingController userNameController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController currencyController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  Loading controller = Get.put(Loading());

  File? imageFile;
  String base64Image = '';

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        base64Image = convertToBase64(imageFile!);
      });
    }
  }

  String convertToBase64(File imageFile) {
    Uint8List bytes = imageFile.readAsBytesSync();
    String base64Image = base64Encode(bytes);
    return base64Image;
  }

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
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        imageFile == null
                            ? const CircleAvatar(
                                radius: 50,
                                backgroundColor: MyColors.primaryColor,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: MyColors.white,
                                ),
                              )
                            : CircleAvatar(
                                radius: 50,
                                backgroundImage: FileImage(imageFile!),
                              ),
                        Positioned(
                          bottom: -1,
                          left: 60,
                          child: InkWell(
                            onTap: () {
                              _pickImage();
                            },
                            child: const Icon(
                              Icons.add_a_photo,
                              color: MyColors.iconColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(
                        text: 'Add Business Logo',
                        fontWeight: FontWeight.w400,
                        fontsize: 15),
                    //--------------------Business Name with *-------------------
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CustomText(
                            text: 'Business Name',
                            fontWeight: FontWeight.bold,
                            fontsize: 12),
                        const Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                    CustomTextField(
                      HintText: 'Enter Business Name',
                      controller: bNameController,
                      // onChanged: (newValue) {
                      //   addressController.textData.value =
                      //       newValue; // Update the value using GetX's reactive variable
                      // },
                    ),
                    //--------------------Address-------------------
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CustomText(
                            text: 'Address',
                            fontWeight: FontWeight.bold,
                            fontsize: 12),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      HintText: 'Enter Address',
                      controller: addressController,
                      // onChanged: (value) {
                      //   addressController.textData.value =
                      //       value; // Update the value in the DataController
                      //}
                    ),
                    //--------------------Currency-------------------
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CustomText(
                            text: 'Currency',
                            fontWeight: FontWeight.bold,
                            fontsize: 12),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                          color: MyColors.button,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 2.0, color: Colors.grey.shade300)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 7.0, left: 5.0, right: 5.0),
                        child: DropdownButtonFormField<Currency>(
                          value: allCurrencies[0],
                          // Set USD as the default currency
                          items: allCurrencies
                              .map((currency) => DropdownMenuItem<Currency>(
                                    value: currency,
                                    child: Text(
                                      currency.currency,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          onChanged: (Currency? selectedCurrency) {
                            // Handle the selection of the currency
                            if (selectedCurrency != null) {
                              currencyController.text =
                                  selectedCurrency.currency;
                            }
                          },
                        ),
                      ),
                    ),
                    //--------------------Phone Number-------------------
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CustomText(
                            text: 'Phone Number',
                            fontWeight: FontWeight.bold,
                            fontsize: 12),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        HintText: 'Enter Phone Number',
                        controller: phoneController),
                    //--------------------User name with *------------------
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CustomText(
                            text: 'User name',
                            fontWeight: FontWeight.bold,
                            fontsize: 12),
                        const Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                    CustomTextField(
                        HintText: 'Enter Username',
                        controller: userNameController),
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
                    //--------------------Confirm Password with *------------------
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CustomText(
                            text: 'Confirm Password',
                            fontWeight: FontWeight.bold,
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
                                      fontSize: 14,
                                      color: Colors.grey.shade400),
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
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 70,
                width: width,
                color: MyColors.backgroundColor,
                child: Center(
                  child:  GetBuilder<Loading>(
                  builder: (con) {
                    return InkWell(
                    onTap: () {
                      signUp(
                        bNameController,
                        emailController,
                        userNameController,
                        confirmPassController,
                        passwordController,
                        addressController,
                        phoneController,
                        currencyController,
                        base64Image,
                      );
                    },
                    child:((con).loading)?LoadingButton():BlueButton(text: 'Sign Up'),
                  );
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
