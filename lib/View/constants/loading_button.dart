import 'package:stock_management/linker.dart';

class LoadingButton extends StatelessWidget {
  LoadingButton();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Container(
      height: 50,
      width: width - 50,
      decoration: BoxDecoration(
        color: MyColors.primaryColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: const Center(
          child: SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(color: Colors.white),
          )
      ),
    );
  }
}
