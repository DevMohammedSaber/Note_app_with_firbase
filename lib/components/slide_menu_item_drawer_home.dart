import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderMenuItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function()? onTap;

  const SliderMenuItem(
      {Key? key,
      required this.title,
      required this.iconData,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: Text(title,
            style:  TextStyle(fontSize:12.sp,
                color: Colors.black, fontFamily: 'BalsamiqSans_Regular',)),
        leading: Icon(iconData, color: Colors.black),
      ),
    );
  }
}

class Menu {
  final IconData iconData;
  final String title;
  final Function()? onItemClick;

  Menu(this.iconData, this.title, this.onItemClick);
}
