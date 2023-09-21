import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app_firebase/constant/colors.dart';

class CustomTextFieldAdd1 extends StatelessWidget {
  const CustomTextFieldAdd1({
    super.key,
    required this.hint, required this.controller,required this.validator, required this.maxLines,
     
  });
  final String hint;
  final int maxLines;

  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 30.w),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width*9
        ),
        child: TextFormField(
          controller: controller,
          validator: validator,
          style: TextStyle(color: AppColor.primayTextColor,fontSize: 19.sp),
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: AppColor.primayTextColor.withOpacity(.8), fontSize: 25.sp),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(color: AppColor.primayColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:const BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            filled: true,
            fillColor: AppColor.primayColor.withOpacity(.2),
            // suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
