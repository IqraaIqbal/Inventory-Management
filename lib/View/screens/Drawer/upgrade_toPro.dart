import 'package:stock_management/linker.dart';

class UpgradeToPro extends StatelessWidget {
  const UpgradeToPro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.backgroundColor,
      ),
      backgroundColor: MyColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                  backgroundColor: MyColors.primaryColor,
                  child: Icon(Icons.inventory, size: 20,color: MyColors.white,)),
              SizedBox(height: 10,),
              CustomText(text: 'Get Premium', fontWeight: FontWeight.bold, fontsize: 14),
              SizedBox(height: 10,),
              CustomText(text: 'Do you want to use app without limits?\n Buy premium unlock all features', fontWeight: FontWeight.bold, fontsize: 14),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 75,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: ListTile(
                    leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.pink,
                        child: Icon(Icons.star, size: 35,color: Colors.orange,)),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Standard', fontWeight: FontWeight.bold, fontsize: 13),
                        CustomText(text: 'Pay Monthly', fontWeight: FontWeight.normal, fontsize: 13),
                      ]
                    ),
                    trailing: CustomText(text: 'Rs 850.00', fontWeight: FontWeight.bold, fontsize: 13),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 75,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: ListTile(
                    leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.yellow,
                        child: Icon(Icons.diamond, size: 35,color: Colors.lightBlue,)),
                    title: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: 'Popular', fontWeight: FontWeight.bold, fontsize: 13),
                          CustomText(text: 'Pay Six Monthly', fontWeight: FontWeight.normal, fontsize: 13),
                        ]
                    ),
                    trailing: CustomText(text: 'Rs 4,300.00', fontWeight: FontWeight.bold, fontsize: 13),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 75,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: ListTile(
                    leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.deepPurple,
                        child: Icon(Icons.castle, size: 35,color: Colors.yellow,)),
                    title: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: 'Best value', fontWeight: FontWeight.bold, fontsize: 13),
                          CustomText(text: 'Pay Yearly', fontWeight: FontWeight.normal, fontsize: 13),
                        ]
                    ),
                    trailing: CustomText(text: 'Rs 7,700.00', fontWeight: FontWeight.bold, fontsize: 13),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
