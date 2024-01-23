import 'package:stock_management/linker.dart';

deleteDialog(ontap,msgText,headingText) {
  Get.defaultDialog(
    title: '',
    content: Column(
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
            headingText,
            fontWeight: FontWeight.bold,
            fontsize: 14),
        const SizedBox(
          height: 15,
        ),
        CustomText(
            text:
            msgText,
            fontWeight: FontWeight.w600,
            fontsize: 14),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: ontap,
          child: Container(
            height: 40,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.red,
            ),
            child: const Center(
              child: Text(
                'Yes, Delete',
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
          child: Container(
            height: 40,
            width: 120,
            child: const Center(
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
}