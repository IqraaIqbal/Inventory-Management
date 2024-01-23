import 'package:stock_management/linker.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    double height=size.height;
    double width=size.width;
    return Scaffold(
      body: Container(
          height: height,
          width: width,
          color: MyColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 93,
              child: Container(
                decoration:  const BoxDecoration(
                    color: MyColors.backgroundColor,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight :Radius.circular(40))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(text: 'This app will manage your inventory management easy and enjoyable', fontWeight: FontWeight.w400, fontsize: 16,),
                      const SizedBox(height: 90,),
                      InkWell(
                          onTap: (){Get.to( SignUpScreen());},
                          child: WhiteButton(text: 'CREATE A NEW ACCOUNTING')),
                      const SizedBox(height: 10,),
                      InkWell(
                          onTap: (){Get.to( ExistingAccount());},
                          child: WhiteButton(text: 'JOIN AN EXISTING ACCOUNTING')),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Center(
                child: Container(
                  // height: 50,
                  color: MyColors.white,
                  child: CustomText(text: "Made by Iqraa♥️", fontWeight: FontWeight.bold, fontsize: 20)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}