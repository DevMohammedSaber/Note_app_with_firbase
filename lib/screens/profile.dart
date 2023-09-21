import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app_firebase/components/custom_button.dart';
import 'package:note_app_firebase/constant/colors.dart';
import 'package:note_app_firebase/provider/provider_profile.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});


  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ProviderProfile>(context);

    return Scaffold(
      body: Container(
        color: AppColor.primayTextColor.withOpacity(.2),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
            future: prov.getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // print(('=======success=====================${snapshot.data[0]['email']}'));
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      '${snapshot.error} occurred',
                      style:  TextStyle(fontSize: 18.sp),
                    ),
                  );
                } else if (snapshot.hasData) {
                  return Stack(
                    children: [
                      Positioned(
                        top: 50.h,
                        left: 10.w,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: AppColor.blackColor,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Positioned(
                        top: 30.h,
                        left: 0,
                        right: 0,
                        child: Container(
                          margin: const EdgeInsets.only(top: 90),
                          width: 150.w,
                          height: 150.h,
                          child: CircleAvatar(
                            child: Image.asset(
                              'assets/profile.png',
                              fit: BoxFit.contain,
                              width: 150.w,
                              height: 150.h,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 315.h,
                        left: 20.w,
                        child: Text(
                          'name :',
                          style: TextStyle(
                              color: AppColor.primayTextColor,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Positioned(
                        top: 350.w,
                        left: 20.w,
                        // right: 10,
                        child: Text(
                          '${snapshot.data[0]['username']}',
                          style: TextStyle(
                              color: AppColor.primayTextColor,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Positioned(
                        top: 435.h,
                        left: 20.w,
                        child: Text(
                          'Email :',
                          style: TextStyle(
                              color: AppColor.primayTextColor,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Positioned(
                        top: 470.h,
                        left: 20.w,
                        // right: 10,
                        child: Text(
                          '${snapshot.data[0]['email']}',
                          style: TextStyle(
                              color: AppColor.primayTextColor,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      // Positioned(
                      //   top: 500,
                      //   left: 20,
                      //   child: Text(
                      //     'Mobile number :',
                      //     style: TextStyle(
                      //         color: AppColor.primayTextColor,
                      //         fontSize: 25,
                      //         fontWeight: FontWeight.w400),
                      //   ),
                      // ),
                      // Positioned(
                      //   top: 535,
                      //   left: 20,
                      //   // right: 10,
                      //   child: Text(
                      //     '01090726516',
                      //     style: TextStyle(
                      //         color: AppColor.primayTextColor,
                      //         fontSize: 30,
                      //         fontWeight: FontWeight.w600),
                      //   ),
                      // ),
                      Positioned(
                        bottom: 100,
                        left: 70,
                        right: 70,
                        // right: 10,
                        child: CustomButton(
                          title: 'Sign Out',
                          onpressed: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.pushNamed(context, 'login');
                          },
                        ),
                      ),
                    ],
                  );
                }
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}

// 