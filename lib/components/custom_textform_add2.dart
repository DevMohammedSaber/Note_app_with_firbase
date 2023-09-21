import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app_firebase/constant/colors.dart';

class CustomTextFieldAdd2 extends StatelessWidget {
  const CustomTextFieldAdd2(
      {super.key,
      required this.hint,
      required this.controller,
      required this.validator,
      });
  final String hint;
 
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 30.w),
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 9),
      child: TextFormField(
        controller: controller,
        validator: validator,
        style: TextStyle(color: AppColor.primayTextColor, fontSize: 19.sp),
        decoration: InputDecoration(
          hintText: hint,
          filled: true,

          
          hintStyle: TextStyle(
              color: AppColor.primayTextColor.withOpacity(.8), fontSize: 25.sp),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: AppColor.primayColor.withOpacity(.2)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          fillColor: AppColor.primayColor.withOpacity(.2),
          // suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
