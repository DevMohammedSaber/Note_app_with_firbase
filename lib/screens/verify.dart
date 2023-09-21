import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app_firebase/components/custom_button.dart';
import 'package:note_app_firebase/constant/colors.dart';

class Verify extends StatelessWidget {
  const Verify({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
             SizedBox(height: 80.h),
            Image.asset(
              'assets/login.png',
              width: 220.w,
              height: 200.h,
              fit: BoxFit.contain,
            ),
             SizedBox(height: 50.h),
            Center(
              child: Text(
                'Verification link was send to you,\nPlease check your email',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.blackColor.withOpacity(.7),
                ),
              ),
            ),
             SizedBox(height: 150.h),
            
            CustomButton(
                onpressed: () async {
                  Navigator.of(context).pushReplacementNamed('login');
                },
                title: 'Go to login'),
          ],
        ),
      ),
    );
  }
}
