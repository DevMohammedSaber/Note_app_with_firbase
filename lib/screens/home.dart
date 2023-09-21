import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:note_app_firebase/components/custom_home_body.dart';
import 'package:note_app_firebase/components/custom_home_floating_button.dart';
import 'package:note_app_firebase/components/home_appbar.dart';
import 'package:note_app_firebase/components/slide_view_drawer_home.dart';
import 'package:note_app_firebase/provider/provider_edit.dart';
import 'package:note_app_firebase/provider/provider_home.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ProviderHome>(context);
    var provEdit = Provider.of<ProviderEdit>(context);

    return Scaffold(
      // appBar: builderAppBar(),
      // body: CustomHomeBody(prov: prov, provEdit: provEdit),
      body: SliderDrawer(
        appBar: builderAppBar(),
        // key: prov.sliderDrawerKey,
        sliderOpenSize: 179.sp,
        slider: const SliderView(),
        child: CustomHomeBody(prov: prov, provEdit: provEdit),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const CustomFloatingActionButtonHome(),
    );
  }
}

