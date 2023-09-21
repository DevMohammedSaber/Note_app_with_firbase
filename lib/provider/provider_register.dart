import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProviderRegister with ChangeNotifier {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();


  createAccountWithEmailAndPassword(BuildContext ctx) async {
    if (formState.currentState!.validate()) {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        FirebaseFirestore.instance.collection('users').add({
          'username': username.text,
          'email': email.text,
          'uid': FirebaseAuth.instance.currentUser!.uid,
        });
        credential.user!.sendEmailVerification();
        // sentOTP();
        if (ctx.mounted) {
          Navigator.of(ctx).pushReplacementNamed('verify');
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password' && ctx.mounted) {
          print('The password provided is too weak.');
          AwesomeDialog(
            context: ctx,
            dialogType: DialogType.info,
            animType: AnimType.rightSlide,
            title: 'Weak password',
            desc: 'Please enter strong password.',
            btnOkOnPress: () {},
            btnOkText: 'Ok',
          ).show();
        } else if (e.code == 'email-already-in-use' && ctx.mounted) {
          print('The account already exists for that email.');
          AwesomeDialog(
            context: ctx,
            dialogType: DialogType.info,
            animType: AnimType.rightSlide,
            title: 'Email used',
            desc: 'please try login.',
            btnOkOnPress: () {},
            btnOkText: 'Ok',
          ).show();
        }
      } catch (e) {
        print(e);
      }
    } else {
      print('Not Valid');
    }
  }
}
