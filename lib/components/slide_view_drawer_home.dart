import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app_firebase/components/slide_menu_item_drawer_home.dart';
import 'package:note_app_firebase/constant/colors.dart';
import 'package:note_app_firebase/provider/provider_home.dart';
import 'package:provider/provider.dart';

class SliderView extends StatelessWidget {
  const SliderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ProviderHome>(context);
    return Container(
      color: AppColor.primayColor.withOpacity(.2),
      padding:  EdgeInsets.only(top: 30.h),
      child: ListView(
        children: <Widget>[
           SizedBox(
            height: 30.h
          ),
          CircleAvatar(
            radius: 65,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: Image.asset('assets/avatar.jpg')
                  .image,
            ),
          ),
           SizedBox(
            height: 20.h
          ),
           Text(
            'Mohamed',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30.sp,
            ),
          ),
           SizedBox(
            height: 20.h
          ),
          ...[
            Menu(Icons.home, 'Home', () {
              // prov.sliderDrawerKey.currentState!.closeSlider();
            }),
            Menu(Icons.notifications_active, 'Notification', () {}),
            Menu(Icons.favorite, 'Favourites', () {
              Navigator.of(context).restorablePushNamed('favourite');
              
            }),
            Menu(Icons.arrow_back_ios, 'LogOut', () {
              prov.signOut(context);
              
            }),
          ]
              .map((menu) => SliderMenuItem(
                  title: menu.title,
                  iconData: menu.iconData,
                  onTap: menu.onItemClick))
              .toList(),
        ],
      ),
    );
  }
}

