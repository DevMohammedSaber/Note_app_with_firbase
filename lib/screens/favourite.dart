import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:note_app_firebase/constant/colors.dart';
import 'package:note_app_firebase/functions/static.dart';
import 'package:note_app_firebase/provider/provider_favourite.dart';
import 'package:note_app_firebase/shared/appstyle.dart';
import 'package:provider/provider.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});




  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ProviderFavourite>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize:  Size.fromHeight(80.0.h),
        child: AppBar(
          backgroundColor: AppColor.primayColor,
          flexibleSpace: Padding(
            padding:  EdgeInsets.only(top:35.h),
            child: Center(
              child: Text(
                'Favourite List ',
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
      body: FutureBuilder(
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
                  padding:  EdgeInsets.only(top: 20.h),
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          Slidable(
                            key: const ValueKey(0),
                            startActionPane: ActionPane(
                              extentRatio: .25,
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
                            child: SizedBox(
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
                                            Text('${snapshot.data[i]['time']}'),
                                            // Text('June'),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        left: 20.w,
                                        top: 10.h,
                                        child: Container(
                                          constraints:  BoxConstraints(
                                            maxHeight: 60.h,
                                            maxWidth: 240.w,
                                          ),
                                          child: Container(
                                            padding:  EdgeInsets.symmetric(
                                                horizontal: 8.w),
                                            decoration: BoxDecoration(
                                              color: Colors.cyan,
                                              // borderRadius:
                                              //     BorderRadius.circular(20),
                                            ),
                                            child: Text(
                                              '${snapshot.data[i]['name']}',
                                              style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold,
                                                color: AppColor.blackColor
                                                    ,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 20.w,
                                        top: 70.h,
                                        child: Container(
                                          constraints:  BoxConstraints(
                                            maxHeight: 80.h,
                                            maxWidth: 300.w,
                                          ),
                                          child: Text(
                                            '${snapshot.data[i]['content']}',
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold,
                                              color: AppColor.whiteColor
                                                  ,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 20.w,
                                        top: 60.h,
                                        bottom: 60.w,
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
                      'No Favourite Notes :()',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primayColor.withOpacity(.7),
                      ),
                    ),
                     SizedBox(height: 10.h),
                    Text(
                      'You have no favourite task.',
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
