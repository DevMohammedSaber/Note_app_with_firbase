import 'package:flutter/material.dart';
import 'package:note_app_firebase/screens/add.dart';
import 'package:note_app_firebase/screens/edit.dart';
import 'package:note_app_firebase/screens/favourite.dart';
import 'package:note_app_firebase/screens/home.dart';
import 'package:note_app_firebase/screens/login.dart';
import 'package:note_app_firebase/screens/onboarding.dart';
import 'package:note_app_firebase/screens/password_reset.dart';
import 'package:note_app_firebase/screens/profile.dart';
import 'package:note_app_firebase/screens/register.dart';
import 'package:note_app_firebase/screens/verify.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const OnBoarding(),
  'login': (context) => const Login(),
  'register': (context) => const Register(),
  'home': (context) => const Home(),
  'verify': (context) =>  const Verify(),
  'resetPassword': (context) =>  const ResetPassword(),
  'add': (context) =>  const Add(),
  'edit': (context) =>  const Edit(),
  'profile': (context) =>  const Profile(),
  'favourite': (context) =>  const Favourite(),
};
