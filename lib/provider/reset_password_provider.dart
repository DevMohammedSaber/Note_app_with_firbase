import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProviderResetPassword with ChangeNotifier {
  TextEditingController email = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  resetPassword(BuildContext ctx) async {
    if (email.text == '') {
      if (ctx.mounted) {
        AwesomeDialog(
          context: ctx,
          dialogType: DialogType.info,
          animType: AnimType.scale,
          // title: 'Password Reset',
          desc: 'Please enter your email.',
          btnOkOnPress: () {},
          btnOkText: 'Ok',
        ).show();
        return;
      }
    }
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
      if (ctx.mounted) {
        AwesomeDialog(
          context: ctx,
          dialogType: DialogType.success,
          animType: AnimType.scale,
          // title: 'Password Reset',
          desc: 'Please check your email to reset password.',
          btnOkOnPress: () {
            Navigator.of(ctx).pushReplacementNamed('login');
          },
          btnOkText: 'Ok',
        ).show();
      }
    } on FirebaseAuthException catch (e) {
      print('++++++++++++$e');
      if (e.code == 'user-not-found') {
        if (ctx.mounted) {
          AwesomeDialog(
            context: ctx,
            dialogType: DialogType.error,
            animType: AnimType.scale,
            // title: 'Password Reset',
            desc: 'Email not found, try register.',
            btnOkOnPress: () {},
            btnOkText: 'Ok',
          ).show();
        }
      }
    }
  }
}
