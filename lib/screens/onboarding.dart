import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app_firebase/components/custom_button.dart';
import 'package:note_app_firebase/constant/colors.dart';
import 'package:note_app_firebase/screens/login.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
             SizedBox(height: 230.h),
            Image.asset(
              'assets/logo.png',
              width: 150.w,
              height: 150.h,
              fit: BoxFit.contain,
            ),
             SizedBox(height: 100.h),
            Text('Made it Simple',
                style: TextStyle(
                  color: AppColor.primayTextColor,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w500,
                )),
            Text(
              'It is important to take care of the patient \nhimself, and he will not be able to support \nthe client. Mauris and Npellentes was in \nflattering mourning.',
              
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: AppColor.secondaryTextColor, fontSize: 18.sp),
            ),
             SizedBox(height: 60.h),
            CustomButton(
              title: 'Get Started',
              onpressed: (){
                Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
        );
              },
            ),
            
          ],
        ),
      ),
    );
  }
}

