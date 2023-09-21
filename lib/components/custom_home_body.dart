import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:note_app_firebase/constant/colors.dart';
import 'package:note_app_firebase/functions/static.dart';
import 'package:note_app_firebase/provider/provider_edit.dart';
import 'package:note_app_firebase/provider/provider_home.dart';
import 'package:note_app_firebase/shared/appstyle.dart';

class CustomHomeBody extends StatelessWidget {
  const CustomHomeBody({
    super.key,
    required this.prov,
    required this.provEdit,
  });

  final ProviderHome prov;
  final ProviderEdit provEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.whiteColor,
      child: FutureBuilder(
        future: prov.getData(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  '${snapshot.error} occurred',
                  style:  TextStyle(fontSize: 18.sp),
                ),
              );
            } else if (snapshot.hasData && snapshot.data.length > 0) {
              return Slidable(
                child: Container(
                  
                  // padding: const EdgeInsets.only(top: 20),
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          Slidable(
                            key: const ValueKey(0),
                            startActionPane: ActionPane(
                              extentRatio: .25.sp,
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                  onPressed: (context) {
                                    prov.deleteData(
                                        snapshot.data[i].id, context);
                                  },
                                  backgroundColor: const Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  
                                  label: 'Delete',
                                ),
                              ],
                            ),
                            endActionPane: ActionPane(
                              extentRatio: .25.sp,
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  // flex: 2,
                                  onPressed: (context) {
                                    Navigator.of(context).pushReplacementNamed(
                                        'edit',
                                        arguments: {
                                          'id': snapshot.data[i].id,
                                        });
                                    provEdit.noteName.text =
                                        snapshot.data[i]['name'];
                                    provEdit.noteContent.text =
                                        snapshot.data[i]['content'];
                                    provEdit.dateTime.text =
                                        snapshot.data[i]['time'];
                                    provEdit.selectedColor =
                                        snapshot.data[i]['color'];
                                  },
                                  backgroundColor: const Color(0xFF7BC043),
                                  foregroundColor: Colors.white,
                                  icon: Icons.edit,
                                  label: 'Edit',
                                ),
                              ],
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * .2,
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                color: cardColor[snapshot.data[i]['color']],
                                child: SizedBox(
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        right: 15.w,
                                        top: 10.h,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${snapshot.data[i]['time']}',
                                              style: appStyle(
                                                13.sp,
                                                Colors.black,
                                                FontWeight.bold,
                                              ),
                                            ),
                                            // Text('June'),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        left: 20.w,
                                        top: 10.h,
                                        child: Container(
                                          constraints:  BoxConstraints(
                                            maxHeight: 70.h,
                                            maxWidth: 240.w,
                                          ),
                                          child: Container(
                                            padding:  EdgeInsets.symmetric(
                                                horizontal: 8.w),
                                            decoration: BoxDecoration(
                                              color: AppColor.primayColor.withOpacity(.8),
                                              // borderRadius:
                                              //     BorderRadius.circular(20),
                                            ),
                                            child: Text(
                                              '${snapshot.data[i]['name']}',
                                              style: appStyle(
                                                17.sp,
                                                AppColor.blackColor,
                                                FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 20.w  ,
                                        top: 70.h,
                                        child: Container(
                                          constraints:  BoxConstraints(
                                            maxHeight: 80.h,
                                            maxWidth: 300.w,
                                          ),
                                          child: Text(
                                            '${snapshot.data[i]['content']}',
                                            style: appStyle(
                                              18.sp,
                                              AppColor.whiteColor,
                                              FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 20.w,
                                        top: 60.h,
                                        bottom: 60.h,
                                        child: SizedBox(
                                          width: 50.w,
                                          height: 50.h,
                                          child: IconButton(
                                            onPressed: () {
                                              prov.addToFavourites(
                                                snapshot.data[i].id,
                                                snapshot.data[i]['favourite'],
                                              );
                                            },
                                            icon: Icon(
                                              Icons.favorite,
                                              color: snapshot.data[i]
                                                          ['favourite'] ==
                                                      'false'
                                                  ? AppColor.greyColor
                                                  : AppColor.redColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              );
            } else if (snapshot.data.length == 0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200.w,
                      height: 200.h,
                      child: Image.asset(
                        'assets/board.png',
                        width: 50.w,
                        height: 50.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                     SizedBox(height: 50.h),
                    Text(
                      'No Notes :()',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primayColor.withOpacity(.7),
                      ),
                    ),
                     SizedBox(height: 10.h),
                    Text(
                      'You have no task to do.',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primayTextColor,
                      ),
                    ),
                  ],
                ),
              );
            }
          }
          print("====================================${snapshot.data}");
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}