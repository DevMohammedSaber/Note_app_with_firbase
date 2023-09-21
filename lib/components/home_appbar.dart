import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:note_app_firebase/constant/colors.dart';
import 'package:note_app_firebase/shared/appstyle.dart';

SliderAppBar builderAppBar() {

  return SliderAppBar(
          appBarColor: AppColor.primayColor,
          appBarHeight: 130.h,
          title: Text(
              'ToDo List ',
              style: appStyle(
                30.sp,
                AppColor.whiteColor,
                FontWeight.bold,
              ),
            ),

        );
    // return PreferredSize(
    //   preferredSize: const Size.fromHeight(80.0),
      // child: AppBar(
      //   backgroundColor: AppColor.primayColor,
      //   flexibleSpace: Padding(
      //     padding: const EdgeInsets.only(top:35),
      //     child: Center(
      //       child: Text(
      //         'ToDo List ',
      //         style: appStyle(
      //           30,
      //           AppColor.whiteColor,
      //           FontWeight.bold,
      //         ),
      //       ),
      //     ),
      //   ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right:20,top: 20),
        //     child: InkWell(
        //           onTap: () {
        //             Navigator.of(context).pushNamed('profile');
        //           },
        //           child: SizedBox(
        //             width: 80,
        //             height: 80,
        //             child: Image.asset(
        //               'assets/profile.png',
        //               fit: BoxFit.contain,
        //             ),
        //           ),
        //         ),
        //   ),

        // ],
        // flexibleSpace: Container(
        //   height: MediaQuery.of(context).size.height,
        //   padding: const EdgeInsets.only(top: 40),
        //   child: Row(
        //     children: [
        //       Container(
        //         width: 320,
        //         padding:
        //             const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        //         child: TextFormField(
        //           cursorHeight: 25,
        //           decoration: InputDecoration(
        //             hintText: 'Search',
        //             suffixIcon: const Icon(Icons.search),
        //             border: OutlineInputBorder(
        //                 borderRadius: BorderRadius.circular(10)),
        //             filled: true,
        //             fillColor: AppColor.whiteColor,
        //           ),
        //           controller: TextEditingController(),
        //         ),
        //       ),
        //       const SizedBox(width: 10),

        //     ],
        //   ),
        // ),
      // ),
    // );
  }

