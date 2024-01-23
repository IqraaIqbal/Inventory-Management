
import 'package:stock_management/Controller/Auth/sign_out.dart';
import 'package:stock_management/linker.dart';

class MyDrawer extends StatelessWidget {
   MyDrawer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    double height=size.height;
    double width=size.width;
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 50,),
              InkWell(
                onTap: (){
                  Get.to(const UpgradeToPro());
                },
                child: Container(
                  height: 70,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.inventory,color: MyColors.iconColor ,size: 25,),
                            const SizedBox(width: 15,),
                            CustomText(text: 'Inventory \nManagement', fontWeight: FontWeight.bold, fontsize: 13)
                          ],
                        ),
                        Container(
                          height: 40,
                          width: width /4,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade200,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.thumb_up_alt,size: 16,color: MyColors.primaryColor,),
                                SizedBox(width: 5,),
                                Text('Go Pro', style: TextStyle(
                                  color: MyColors.primaryColor,fontSize: 16,fontWeight: FontWeight.bold
                                ),)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
               // height: 70,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Get.to( Setting());
                        },
                          child: DrawerListTile(text: 'Settings', icon: Icons.settings)),
                      const Divider(height:1.0,color: Colors.grey,),
                      DrawerListTile(text: 'Reports', icon: Icons.receipt_long_rounded),
                      const Divider(height:1.0,color: Colors.grey,),
                      DrawerListTile(text: 'My Business', icon: Icons.business_outlined),
                      const Divider(height:1.0,color: Colors.grey,),
                      DrawerListTile(text: 'Collaborators', icon: Icons.group),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                // height: 70,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      DrawerListTile(text: 'Rate us', icon: Icons.star_border),
                      const Divider(height:1.0,color: Colors.grey,),
                      DrawerListTile(text: 'Share with Friends', icon: Icons.share),
                      const Divider(height:1.0,color: Colors.grey,),
                      DrawerListTile(text: 'Privacy Policy', icon: Icons.privacy_tip_outlined),
                      const Divider(height:1.0,color: Colors.grey,),
                      DrawerListTile(text: 'Terms of Service', icon: Icons.library_books_outlined),
                      const Divider(height:1.0,color: Colors.grey,),
                      InkWell(
                          onTap:(){
                            Get.defaultDialog(
                                title: 'LogOut',
                                titleStyle: const TextStyle(color: MyColors.text,fontSize: 15,fontWeight: FontWeight.bold),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomText(text: 'Are You Sure?', fontWeight: FontWeight.normal, fontsize: 13),
                                    CustomText(text: 'You want to logout this app?', fontWeight: FontWeight.normal, fontsize: 13),
                                    const SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap:(){
                                            Get.to(AccountScreen());
                                            signUserOut();
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: MyColors.primaryColor,
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                            child: const Center(child: Text('Sure',style: TextStyle(color: MyColors.white,fontWeight: FontWeight.bold,fontSize: 13),)),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            Get.back();
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              border: Border.all(color: MyColors.primaryColor,width: 1.0),
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                            child: const Center(child: Text('Cancel',style: TextStyle(color: MyColors.primaryColor,fontWeight: FontWeight.bold,fontSize: 13),)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                            );
                          },
                          child: DrawerListTile(text: 'Logout', icon: Icons.logout_rounded)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const Text('Version 1.0.1',style: TextStyle(
                fontSize: 13,color: Colors.grey
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
