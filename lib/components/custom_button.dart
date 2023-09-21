import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app_firebase/constant/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,required this.onpressed, required this.title,
  });
  final void Function()? onpressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 60.h,
      minWidth: 290.w,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      color: AppColor.primayColor,
      child: Text(
        title,
        style: TextStyle(
          color: AppColor.whiteColor,
          fontSize: 21,
          fontWeight: FontWeight.w500,
        ),
      ),
      onPressed: onpressed,
    );
  }
}
