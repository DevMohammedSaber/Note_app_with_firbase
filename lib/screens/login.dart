import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app_firebase/provider/provider_login.dart';
import 'package:note_app_firebase/components/custom_button.dart';
import 'package:note_app_firebase/components/custom_textfield.dart';
import 'package:note_app_firebase/constant/colors.dart';
import 'package:note_app_firebase/functions/valid_input.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  


  // GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ProviderLogin>(context);

    return Scaffold(
      body: prov.isLoading ? Center(child: CircularProgressIndicator()) :Form(
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
                  'assets/logo.png',
                  width: 220.w,
                  height: 200.h,
                  fit: BoxFit.contain,
                ),
                 SizedBox(height: 50.h),
                CustomTextField(
                  obscureText: false,
                  controller: prov.email,
                  validator: (val) {
                    return validInput(val!, 10, 70);
                  },
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
                  controller: prov.password,
                  obscureText: prov.isVisible,
                  suffixIcon: IconButton(
                    onPressed: (){prov.changeVisibility();},
                    icon: prov.isVisible ? Icon(Icons.visibility,size: 25.sp,):Icon(Icons.visibility_off ,size: 25.sp,),),
                  hint: 'Password',
                  perfixIcon: Icon(
                    CupertinoIcons.lock,
                    color: AppColor.primayColor,
                    size: 27.sp,
                  ),
                ),
                 SizedBox(height: 10.h),
                Row(
                  children: [
                    const Spacer(flex: 5),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('resetPassword');
                      },
                      child: Text('Forget password?'),
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
                 SizedBox(height: 40.h),
                CustomButton(
                  onpressed: () {
                    prov.loginWithEmailAndPassword(context);
                  },
                  title: 'Login',
                ),
                 SizedBox(height: 20.h),
                // SignInButton(
                //   padding:
                //       const EdgeInsets.symmetric(vertical: 13, horizontal: 33),
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10)),
                //   Buttons.GoogleDark,
                //   text: "Sign up with Google",
                //   onPressed: () {
                //     prov.signInWithGoogle(context);
                //   },
                // ),
                 SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: TextStyle(
                        color: AppColor.greyColor.withOpacity(.5),
                      ),
                    ),
                     SizedBox(width: 15.w),
                    InkWell(
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                            color: AppColor.primayColor, fontSize: 20.sp),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('register');
                      },
                    ),
                  ],
                ),
                 SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
