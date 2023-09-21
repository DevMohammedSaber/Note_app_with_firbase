import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app_firebase/constant/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.suffixIcon,
    required this.obscureText,
    required this.perfixIcon,
    required this.controller,
    required this.validator,
  });
  final String hint;
  final Widget perfixIcon;
  final Widget? suffixIcon;
  final bool obscureText ;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 30.h),
      child: Row(
        children: [
          perfixIcon,
          SizedBox(width: 20.w),
          SizedBox(
            width: 280.w,
            child: TextFormField(
              obscureText : obscureText,
              controller: controller,
              validator: validator,
              decoration: InputDecoration(
                
                suffixIcon: suffixIcon,
                
                hintText: hint,
                hintStyle: TextStyle(color: AppColor.greyColor.withOpacity(.5)),
                fillColor: AppColor.primayColor,
                // suffixIcon: suffixIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
