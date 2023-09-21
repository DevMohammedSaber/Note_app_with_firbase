import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app_firebase/components/custom_button.dart';
import 'package:note_app_firebase/components/custom_textfield.dart';
import 'package:note_app_firebase/constant/colors.dart';
import 'package:note_app_firebase/functions/valid_input.dart';
import 'package:note_app_firebase/provider/reset_password_provider.dart';
import 'package:provider/provider.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});


  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ProviderResetPassword>(context);
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
               SizedBox(height: 200.h),
              Image.asset(
                'assets/login.png',
                width: 220.w,
                height: 200.h,
                fit: BoxFit.contain,
              ),
               SizedBox(height: 50.h),
              CustomTextField(
                validator: (val) {
                  return validInput(val!, 10, 70);
                },
                obscureText: false,
                controller: prov.email,
                hint: 'Email',
                perfixIcon: Icon(
                  Icons.email_outlined,
                  color: AppColor.primayColor,
                  size: 27.sp,
                ),
              ),
               SizedBox(height: 50.h),
              CustomButton(
                title: 'Reset',
                onpressed: () {
                  prov.resetPassword(context);
                },
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
