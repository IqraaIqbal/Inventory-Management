import 'package:stock_management/linker.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 70,
      decoration: BoxDecoration(
        color: MyColors.primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(child: Text('Save',style: TextStyle(color: MyColors.white,fontWeight: FontWeight.bold,fontSize: 13),)),
    );
  }
}
