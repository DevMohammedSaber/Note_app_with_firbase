import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app_firebase/constant/colors.dart';

class CustomFloatingActionButtonHome extends StatelessWidget {
  const CustomFloatingActionButtonHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.transparent,
      heroTag: 'add',
      elevation: 0,
      child: Container(
        width: 90.w,
        height: 90.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColor.primayColor,
        ),
        child: Icon(
          Icons.add,
          size: 45.sp,
          weight: 50.w,
          color: AppColor.whiteColor,
        ),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed('add');
      },
    );
  }
}

