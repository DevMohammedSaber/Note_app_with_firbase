import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app_firebase/components/custom_button.dart';
import 'package:note_app_firebase/components/custom_textform_add1.dart';
import 'package:note_app_firebase/components/custom_textform_add2.dart';
import 'package:note_app_firebase/constant/colors.dart';
import 'package:note_app_firebase/functions/static.dart';
import 'package:note_app_firebase/functions/valid_input.dart';
import 'package:note_app_firebase/shared/appstyle.dart';
import 'package:provider/provider.dart';
import '../provider/provider_add.dart';

class Add extends StatelessWidget {
  const Add({super.key});

  


  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ProviderAdd>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:  Size.fromHeight(80.0.h),
        child: AppBar(
          backgroundColor: AppColor.primayColor,
          flexibleSpace: Padding(
            padding:  EdgeInsets.only(top: 35.h),
            child: Center(
              child: Text(
                'Add Note',
                style: appStyle(
                  30.sp,
                  AppColor.whiteColor,
                  FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: prov.formState,
          child: SingleChildScrollView(
            child: Column(
              children: [
                 SizedBox(height: 20.h),
                CustomTextFieldAdd2(
                  controller: prov.noteName,
                  validator: (val) {
                    return validInput(val!, 1, 1000);
                  },
                  hint: 'Title....',
                ),
                 SizedBox(height: 20.h),
                CustomTextFieldAdd1(
                  controller: prov.noteContent,
                  maxLines: 10,
                  validator: (val) {
                    return validInput(val!, 1, 1000);
                  },
                  hint: 'Description....',
                ),
                 SizedBox(height: 20.h),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 30.w),
                  child: DateTimePicker(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColor.primayColor.withOpacity(.2),
                      contentPadding:
                           EdgeInsets.symmetric(horizontal: 15.w),
                      // ignore: prefer_const_constructors
                      prefixIcon: Icon(Icons.event),
                      border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(
                            color: AppColor.primayColor.withOpacity(.2)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    type: DateTimePickerType.dateTimeSeparate,
                    // initialValue: DateTime.now().toString(),
                    initialDate: DateTime.now(),
                    timeFieldWidth: 120.w,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    dateLabelText: 'Date',
                    timeLabelText: "Hour",
                    controller: prov.dateTime,
                    // onChanged: (val) => print(val),
                    validator: (val) {
                      print(val);
                      return validInput(val!, 15, 50);
                    },
                    // onSaved: (val) => print(val),
                  ),
                ),
                 SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Choose color',
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: AppColor.primayTextColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Wrap(
                      children: List<Widget>.generate(cardColor.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            prov.selectedColor = index;
                            prov.getSelectedColor();
                          },
                          child: Padding(
                            padding:  EdgeInsets.only(right: 8.w),
                            child: CircleAvatar(
                              radius: 14,
                              backgroundColor: cardColor[index],
                              child: prov.selectedColor == index
                                  ? Icon(
                                      Icons.done,
                                      color: AppColor.whiteColor,
                                      size: 16.sp,
                                    )
                                  : Container(),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
                 SizedBox(height: 40.h),
                CustomButton(
                  onpressed: () {
                    prov.addNote(context);
                  },
                  title: 'Add Note',
                ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   child: Container(
      //     width: 90,
      //     height: 90,
      //     decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(100),
      //       color: AppColor.primayColor,
      //     ),
      //     child: Icon(
      //       Icons.camera_alt,
      //       size: 45,
      //       weight: 50,
      //       color: AppColor.whiteColor,
      //     ),
      //   ),
      //   onPressed: () {},
      // ),
    );
  }
}
