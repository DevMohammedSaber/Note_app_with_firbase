import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app_firebase/components/custom_button.dart';
import 'package:note_app_firebase/components/custom_textfield.dart';
import 'package:note_app_firebase/constant/colors.dart';
import 'package:note_app_firebase/functions/valid_input.dart';
import 'package:note_app_firebase/provider/provider_register.dart';
import 'package:note_app_firebase/screens/login.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget {
  const Register({super.key});



  // EmailAuth emailAuth = EmailAuth(sessionName: "Sample session");

   
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ProviderRegister>(context);
    return Scaffold(
      body: Form(
        key: prov.formState,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 SizedBox(height: 110.h),
                Image.asset(
                  'assets/login.png',
                  width: 220.w,
                  height: 200.h,
                  fit: BoxFit.contain,
                ),
                 SizedBox(height: 50.h),
                CustomTextField(
                  validator: (val) {
                    return validInput(val!, 6, 70);
                  },
                obscureText: false,

                  controller: prov.username,
                  hint: 'Username',
                  perfixIcon: Icon(
                    CupertinoIcons.person,
                    color: AppColor.primayColor,
                    size: 27.sp,
                  ),
                ),
                 SizedBox(height: 30.h),
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
                 SizedBox(height: 30.h),
                CustomTextField(
                  validator: (val) {
                    return validInput(val!, 6, 30);
                  },
                obscureText: false,

                  controller: prov.password,
                  hint: 'Password',
                  perfixIcon: Icon(
                    CupertinoIcons.lock,
                    color: AppColor.primayColor,
                    size: 27.sp,
                  ),
                ),
                 SizedBox(height: 50.h),
                CustomButton(
                    onpressed: () async {
                      prov.createAccountWithEmailAndPassword(context);
                      // prov.sentOTP();
                    },
                    title: 'Sign Up'),
                 SizedBox(height: 50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: AppColor.greyColor.withOpacity(.5),
                      ),
                    ),
                     SizedBox(width: 15.w),
                    InkWell(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            color: AppColor.primayColor, fontSize: 20.sp),
                      ),
                      onTap: () {
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
                // ignore: prefer_const_constructors
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
