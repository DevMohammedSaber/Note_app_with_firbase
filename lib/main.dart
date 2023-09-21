import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:note_app_firebase/provider/provider_add.dart';
import 'package:note_app_firebase/provider/provider_edit.dart';
import 'package:note_app_firebase/provider/provider_favourite.dart';
import 'package:note_app_firebase/provider/provider_home.dart';
import 'package:note_app_firebase/provider/provider_login.dart';
import 'package:note_app_firebase/provider/provider_profile.dart';
import 'package:note_app_firebase/provider/provider_register.dart';
import 'package:note_app_firebase/provider/reset_password_provider.dart';
import 'package:note_app_firebase/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ProviderRegister>(create: (_) => ProviderRegister()),
    ChangeNotifierProvider<ProviderLogin>(create: (_) => ProviderLogin()),
    ChangeNotifierProvider<ProviderResetPassword>(
        create: (_) => ProviderResetPassword()),
    ChangeNotifierProvider<ProviderAdd>(create: (_) => ProviderAdd()),
    ChangeNotifierProvider<ProviderHome>(create: (_) => ProviderHome()),
    ChangeNotifierProvider<ProviderEdit>(create: (_) => ProviderEdit()),
    ChangeNotifierProvider<ProviderProfile>(create: (_) => ProviderProfile()),
    ChangeNotifierProvider<ProviderFavourite>(
        create: (_) => ProviderFavourite()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
        

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('===============================User is currently signed out!');
      } else {
        print('===============================User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('=================width==============${MediaQuery.of(context).size.width}');
        print('=================height==============${MediaQuery.of(context).size.height}');
    return ScreenUtilInit(
      designSize: const Size(412,868),
      builder: (context, child) {
      
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        //home: const OnBoarding(),
        initialRoute: (FirebaseAuth.instance.currentUser != null &&
                FirebaseAuth.instance.currentUser!.emailVerified)
            ? 'home'
            : '/',
        // home: Verify(),
        routes: routes,
      );
    });
  }
}
